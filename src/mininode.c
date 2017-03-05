/**
 * @file mininode.c
 * @author Alex Caudill (credit to creationix and midipix)
 * @date 18 Jul 2016
 * @brief mininode(1) command line entry point
 *
 * mininode.c parses command line arguments and starts the event loop,
 * then immediately hands off control of execution to Javascript code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <string.h>
#include <limits.h>
#include <getopt.h>
#include "uv.h"
#include "duktape.h"
#include "mininode.h"
#include "builtin_hash.h"

/* Accepted flags for getopt() */
#define OPTSTRING "chipvz"
/* Flag set by -p */
static int print_flag = 0;
/* Flag set by -c */
static int check_flag = 0;
/* Flag set by -i */
static int interactive_flag = 0;
/* Flag set by --z */
static int zero_fill_flag = 0;
/* The event loop. */
uv_loop_t *mn_loop;
/* The line number of an active exception from the mininode stdlib */
extern int lineNumber;
/* The filename which caused an active exception */
extern char *filename;

void
mn_short_help() {
	printf("Usage: mininode [options] script.js\n");
}

int
mn_get_stack_raw(duk_context *ctx) {
	if (!duk_is_object(ctx, -1)) {
		return 1;
	}

	if (!duk_has_prop_string(ctx, -1, "stack")) {
		return 1;
	}

	if (!duk_is_error(ctx, -1)) {
		/* Not an Error instance, don't read "stack". */
		return 1;
	}

	duk_get_prop_string(ctx, -1, "stack");  /* caller coerces */
	duk_remove(ctx, -2);
	return 1;
}

duk_ret_t
mn_stash_argv(duk_context *ctx) {
	char **argv = (char **) duk_require_pointer(ctx, 0);
	int argc = (int) duk_require_int(ctx, 1);
	int i;

	duk_push_global_stash(ctx);
	duk_push_array(ctx);
	for (i = 0; i < argc; i++) {
		duk_push_string(ctx, argv[i]);
		duk_put_prop_index(ctx, -2, i);
	}
	duk_put_prop_string(ctx, -2, "argv");
	duk_pop(ctx);
	return 0;
}

/* Print error to stderr and pop error. */
void
mn_print_pop_error(duk_context *ctx, FILE *f) {
	/* 
	 * Print error objects with a stack trace specially.
	 * Note that getting the stack trace may throw an error
	 * so this also needs to be safe call wrapped.
	 */
	//(void)duk_safe_call(ctx, mn_get_stack_raw, 1 /*nargs*/, 1 /*nrets*/);
	
	//fprintf(f, "%s\n", duk_safe_to_string(ctx, -1));
	fflush(f);
	duk_pop(ctx);
}

void
mn_dump_error(duk_context *ctx, duk_idx_t idx) {
	if (duk_is_error(ctx, idx)) {
		duk_get_prop_string(ctx, -1, "stack");
		fprintf(stderr, "\n%s\n\n", duk_get_string(ctx, -1));
		duk_pop(ctx);
	} else {
		fprintf(
			stderr,
			"\nError: %s\n\n",
			duk_json_encode(ctx, idx)
		);
	}
}

/*
 * Donate our body to science in the event of death.
 */
void
mn_fatal_handler(duk_context *ctx, duk_errcode_t code, const char *msg) {
	fprintf(stderr, "\nUncaught Exception:\n");
	fprintf(stderr, "*** FATAL: %s\n", msg ? msg : "no message");
	fprintf(stderr, "Causing intentional segfault...\n");
	fflush(stderr);
	*((volatile unsigned int *) 0) = (unsigned int) 0xdeadbeefUL;
	abort();
}

/* 
 * mn_stdin_to_tmpfile() is based on code from midipix. 
 * git.midipix.org/cgit.cgi/mdso/tree/src/driver/mdso_unit_ctx.c#n34
 * Huge thanks to midipix!
 */
FILE *
mn_stdin_to_tmpfile() {
	FILE *ftmp;
	char buf[4096];
	ssize_t	nread;
	int ret;

	if (!(ftmp = tmpfile())) {
		return 0;	
	}

	nread = read(0,buf,sizeof(buf)-1);

	while (nread) {
		if (nread > 0) {
			buf[nread] = '\0';
			ret = fputs(buf,ftmp);
		} else {
			ret = (errno == EINTR) ? 0 : -1;
		}

		if (ret < 0) {
			fclose(ftmp);
			return 0;
		}

		nread = read(0,buf,sizeof(buf)-1);
	}

	return ftmp;	
}


/*
 * A required module prefixed with '/' is an absolute path.
 * A required module prefixed with './' is a relative path.
 *
 * If the specified modname is a directory, look in it for
 * a package.json file and include the 'main' entry there.
 *
 * .js files are interpreted as JavaScript text files, and
 * .json files are parsed as JSON text files
 *
 * NOTE: .node files are not supported.
 *
 * For built-in modules, we need to map from, e.g., 'v8' to
 * dukopen_v8. This is done with a gperf(1) perfect hash,
 * see src/include/builtin_hash.gperf for the details.
 */
duk_ret_t
cb_resolve_module(duk_context *ctx) {
	/*
	 *  Entry stack: [ requested_id parent_id ]
	 */
	const char *requested_id = duk_get_string(ctx, 0);
	const char *parent_id = duk_get_string(ctx, 1);  /* calling module */
	/* FIXME */
	builtin *module = find_builtin(requested_id, strlen(requested_id));
	if (module) {
		const char *resolved_id = requested_id;
		duk_push_string(ctx, resolved_id);
		return 1; /*nrets*/
	} else {
		duk_push_sprintf(ctx, "Cannot find module '%s'", requested_id);
		duk_throw(ctx);
	}

	/* Arrive at the canonical module ID somehow. */
	//duk_push_string(ctx, resolved_id);
	//return 1; /*nrets*/

}

duk_ret_t
cb_load_module(duk_context *ctx) {
	/*
	 *  Entry stack: [ resolved_id exports module ]
	 */
	const char *modname = duk_require_string(ctx, 0);
	builtin *module = find_builtin(modname, strlen(modname));

	if (module) {
		module->loader(ctx);
		return 0;
	} else {
		/* Arrive at the JS source code for the module somehow. */
		//duk_push_string(ctx, module_source);
		/* Just punt on file lookup logic for now. */
		return 0;  /*nrets*/
	}

	/* We never get here. */
	return 0;
}

int
main(int argc, char **argv) {
	duk_context *ctx = NULL; /* The heart of mininode! */
	int c = 0;               /* Used by getopt. */
	char *filename = NULL;   /* Kinda self-explanatory. */
	FILE *script = NULL;     /* Pointer to the script to execute */
	char *source = NULL;     /* The actual source to execute. */
	long srclen = 0;         /* The length of source buffer */
	size_t srcsz = 0;        /* Size of NUL-terminated source buffer. */

	/* This isn't strictly necessary, but we'll do it anyway. */
	uv_setup_args(argc, argv);

	while ((c = getopt(argc, argv, OPTSTRING)) != -1) {
		switch (c) {
			case 'h':
				mn_short_help();
				exit(EXIT_SUCCESS);
			case 'v':
				printf("Version %s\n", MININODE_VERSION);
				exit(EXIT_SUCCESS);
			case 'p':
				if (print_flag == 0) {
					print_flag = 1;
				} else {
					goto sadplace;
				}
				break;
			case 'c':
				if (check_flag == 0) {
					check_flag = 1;
				} else {
					goto sadplace;
				}
				break;
			case 'i':
				if (interactive_flag == 0){
					interactive_flag = 1;
				} else {
					goto sadplace;
				}
				break;
			case 'z':
				if (zero_fill_flag == 0) {
					zero_fill_flag = 1;
				} else {
					goto sadplace;
				}
				break;
			default:
				goto sadplace;
		}
	}
	/*
	 * Only accept one non-option file argument.
	 */
	if (argc > optind) {
		if (argc - optind > 1) {
			goto sadplace;
		} else {
			filename = argv[optind];
		}
	}
	/* 
	 * Initialize the event loop.
	 */
	mn_loop = uv_default_loop();
	/*
	 * See http://duktape.org/api.html#duk_create_heap
	 * 
	 * This might be an interesting place to use portableumem.
	 */
	if (zero_fill_flag) {
		fprintf(stderr, "WARNING: -z is currently unimplemented.\n");
		ctx = duk_create_heap(
			NULL, /* TODO: calloc() here */
			NULL,
			NULL,
			&mn_loop,
			(void *)&mn_fatal_handler
		);
	} else {
		ctx = duk_create_heap(
			NULL,
			NULL,
			NULL,
			&mn_loop,
			(void *)&mn_fatal_handler
		);
	}

	if (!ctx) {
		fprintf(stderr, "Failed to create a Duktape context!\n");
		goto sadplace;
	}

	/* Detect piped input and use it as our script. */
	/* If we were invoked with -i, try to start the REPL. */
	if (!isatty(fileno(stdin)) && !interactive_flag) {
		filename = "/dev/stdin";
		script = mn_stdin_to_tmpfile();
	} else {
		/* If invoked without any file arguments, invoke the REPL. */
		if (argc == 1 || interactive_flag) {
			printf("repl is currently unimplemented.\n");
			goto sadplace;
		}

		/* If we can't access the file, exit. */
		if (access(filename, R_OK) == -1) {
			fprintf(stderr, "Error: cannot read %s\n", filename);
			goto sadplace;
		} else {
			script = fopen(filename, "r");
		}
	}
	/*
	 * This loads the initial entry point either from the CLI or
	 * from a tmpfile created via stdin input. This entry script
	 * will have the *true* global __filename and __dirname.
	 */
	if (script != NULL) {
		if (fseek(script, 0L, SEEK_END) == 0) {
			srclen = ftell(script);

			if (srclen == -1) {
				fprintf(stderr, "An unknown error occurred!\n");
				goto sadplace;
			}

			source = malloc(sizeof(char) * (srclen + 1));

			if (fseek(script, 0L, SEEK_SET) != 0) {
				fprintf(stderr, "An unknown error occurred!\n");
				goto sadplace;
			}
			/*
			 * TODO: Check for the shebang (#!/path/to/mininode)
			 * line here and remove it from the source buffer,
			 * so that files formatted as scripts may be ran
			 * when passed as file arguments or via stdin.
			 *
			 * If the first character is '\n', continue reading.
			 * If the next two characters are #!, continue until
			 * we encounter another \n.
			 */
			srcsz = fread(source, sizeof(char), srclen, script);

			if (ferror(script) != 0) {
				fprintf(stderr, "Error reading file\n");
			} else {
				source[srcsz++] = '\0'; /* Just to be safe. */
			}
		}
		fclose(script);	
	} else {
		fprintf(stderr, "Could not open file!\n");
		goto sadplace;
	}
        /*
	 * Stash argv and argc for later use by the 'process' module.
	 */
	duk_push_pointer(ctx, (void *) argv);
	duk_push_int(ctx, argc);
	if (duk_safe_call(ctx, mn_stash_argv, 2, 1, 1)) {
		mn_print_pop_error(ctx, stderr);
		//duv_dump_error(ctx, -1);
		uv_loop_close(mn_loop);
		duk_destroy_heap(ctx);
		return 1;
	}
	duk_pop(ctx);
	/* 
	 * Stash the refs array.
	 */
	mn_ref_setup(ctx);
	/*
	 * Connect the Duk context with the event loop.
	 */
	mn_loop->data = ctx;
	/*
	 * Register our module loader with the Duktape context.
	 */
	duk_push_object(ctx);
	duk_push_c_function(ctx, cb_resolve_module, DUK_VARARGS);
	duk_put_prop_string(ctx, -2, "resolve");
	duk_push_c_function(ctx, cb_load_module, DUK_VARARGS);
	duk_put_prop_string(ctx, -2, "load");
	mn_module_loader_init(ctx);
	/*
	 * Register globals.
	 * See https://nodejs.org/dist/v6.2.2/docs/api/globals.html
	 *
	 * TODO: Actually implement all the builtin modules!
	 *
	 * Note that the 'timer' functions do not expose an
	 * object (viz 'console', 'process', 'buffer', etc). 
	 * The timer functions return an opaque object that 
	 * has the 'ref' and 'unref' methods.
	 *
	 * Also note that some built-ins may be invoked
	 * directly by other built-in functions without being
	 * included in the global namespace. This is useful
	 * with mn_bi_util_format() and mn_bi_console_log().
	 */
	//mn_bi_errors(ctx);
	//mn_bi_timers(ctx);
	//mn_bi_events(ctx);
	//mn_bi_buffer(ctx);
	//mn_bi_process(ctx);
	mn_bi_console(ctx);
	//duk_pop(ctx);

	if (!check_flag && !print_flag) {
		if (source != NULL) {
			/* 
			 * compile and run the contents of char *source
			 */
			if (duk_pcompile_lstring(ctx, 0, source, srclen) != 0) {
				printf(
					"compile failed: %s\n",
					duk_safe_to_string(ctx, -1)	
				);
			} else {
				free(source);
				mn_module_eval_main(ctx, filename);
				if (duk_pcall(ctx, 1) == DUK_EXEC_SUCCESS) {
					uv_run(mn_loop, UV_RUN_DEFAULT);
				} else {
					mn_dump_error(ctx, -1);
					exit(EXIT_FAILURE);
				}
			}
			duk_pop(ctx);
			exit(EXIT_SUCCESS);
		} else {
			/* We should never get here. */
			fprintf(stderr, "An unknown error occurred!\n");
			goto sadplace;
		}
	} else {
		fprintf(stderr, "-c and -p are currently unimplemented.\n");
		goto sadplace;
	}

	/* TODO: Support check_flag and print_flag */

	uv_loop_close(mn_loop);
	duk_destroy_heap(ctx);
	exit(EXIT_SUCCESS);

	sadplace:
		mn_short_help();
		exit(EXIT_FAILURE);
}
