/**
 * mininode - Node.js for Embedded Systems.
 *
 * Copyright (c) 2016 Alex Caudill. All rights reserved.
 *
 * See LICENSE.txt for the MIT license.
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
#include "modules.h"

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

void
mn_short_help() {
	printf("Usage: mininode [options] script.js\n");
}

void
mn_sighandler(int x) {
	/*
	 * TODO: Signals should be passed upstack to the
	 * Javascript runtime. For now, just print them.
	 */
	fprintf(stderr, "Got signal %d\n", x);
	fflush(stderr);
}

void
mn_set_sigint_handler(void) {
	(void)signal(SIGINT, mn_sighandler);
	(void)signal(SIGPIPE, SIG_IGN);  /* avoid SIGPIPE killing process */
}

void
mn_fatal_handler(const char *msg) {
	fprintf(stderr, "*** FATAL ERROR: %s\n", msg ? msg : "no message");
	fprintf(stderr, "Causing intentional segfault...\n");
	fflush(stderr);
	*((volatile unsigned int *) 0) = (unsigned int) 0xdeadbeefUL;
	abort();
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

/* Print error to stderr and pop error. */
void
mn_print_pop_error(duk_context *ctx, FILE *f) {
	/* 
	 * Print error objects with a stack trace specially.
	 * Note that getting the stack trace may throw an error
	 * so this also needs to be safe call wrapped.
	 */
	(void)duk_safe_call(ctx, mn_get_stack_raw, 1 /*nargs*/, 1 /*nrets*/);
	fprintf(f, "%s\n", duk_safe_to_string(ctx, -1));
	fflush(f);
	duk_pop(ctx);
}

void *
mn_zmalloc(size_t size) {
	void *ret = calloc(1, size);
	return ret;
}


FILE *
mn_stdin_to_tmpfile() {
	FILE *	ftmp;
	char	buf[4096];
	ssize_t	nread;
	int 	ret;

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

duk_ret_t
mn_mod_load(FILE *file, duk_context *ctx) {
	return 1;
}

duk_ret_t
mn_mod_search(duk_context *ctx) {
	/*
	 * We get the following duk stack arguments:
	 *   index 0: id
	 *   index 1: require
	 *   index 2: exports
	 *   index 3: module
	 *
	 * For built-in modules, we need to map from, e.g., 'v8' to 
	 * dukopen_v8. This needs to happen quickly, ideally O(1), due
	 * to the fact that it is the first step in module loading.
	 */

	return 1;
}

int
main(int argc, char **argv) {

	duk_context *ctx = NULL; /* The heart of mininode! */
	int c = 0;               /* Used by getopt. */
	char *filename = NULL;   /* Kinda self-explanatory. */
	FILE *script = NULL;     /* Pointer to the script to execute */
	char *source = NULL;     /* The actual source to execute. */
	long srclen;             /* The length of source buffer */
	size_t srcsz;		 /* Size of NUL-terminated source buffer. */
	uv_loop_t *loop =  NULL; /* The event loop. */

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
					mn_short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'c':
				if (check_flag == 0) {
					check_flag = 1;
				} else {
					mn_short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'i':
				if (interactive_flag == 0){
					interactive_flag = 1;
				} else {
					mn_short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'z':
				if (zero_fill_flag == 0) {
					zero_fill_flag = 1;
				} else {
					mn_short_help();
					exit(EXIT_FAILURE);
				}
				break;
			default:
				mn_short_help();
				exit(EXIT_FAILURE);
		}
	}

	if (argc > optind) {
		/* Only accept one non-option file argument. */
		if (argc - optind > 1) {
			mn_short_help();
			exit(EXIT_FAILURE);
		} else {
			filename = argv[optind];
		}
	}

	/* Set the sigint handler and initialize the loop. */
	mn_set_sigint_handler();
	loop = uv_default_loop();

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
			&loop,
			(void *)&mn_fatal_handler
		);
	} else {
		ctx = duk_create_heap(
			NULL,
			NULL,
			NULL,
			&loop,
			(void *)&mn_fatal_handler
		);
	}

	if (!ctx) {
		printf("Failed to create a Duktape context!\n");
		exit(EXIT_FAILURE);
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
			mn_short_help();
			exit(EXIT_FAILURE);
		}

		/* If we can't access the file, exit. */
       		if (access(filename, R_OK) == -1) {
       			fprintf(stderr, "Error: file %s not readable\n", filename);
       			mn_short_help();
       			exit(EXIT_FAILURE);
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
				exit(EXIT_FAILURE);
			}

			source = malloc(sizeof(char) * (srclen + 1));

			if (fseek(script, 0L, SEEK_SET) != 0) {
				fprintf(stderr, "An unknown error occurred!\n");
				exit(EXIT_FAILURE); 
			}
			
			/*
			 * TODO: Check for the shebang (#!/path/to/mininode)
			 * line here and remove it from the source buffer,
			 * so that files formatted as scripts may be ran
			 * when passed as file arguments or via stdin.
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
		exit(EXIT_FAILURE);
	}

	/*
	 * Register our module loader with the Duktape context.
	 */
	duk_get_global_string(ctx, "Duktape");
	duk_push_c_function(ctx, mn_mod_search, 4 /*nargs*/);
	duk_put_prop_string(ctx, -2, "modSearch");
	duk_pop(ctx);
	/*
	 * Register globals.
	 * See https://nodejs.org/dist/v6.2.2/docs/api/globals.html
	 *
	 * First, register the global 'timer' functions.
	 */
	duk_push_c_function(ctx, dukopen_timers, 0 /*nargs*/);
	duk_call(ctx, 0);
	/*
	 * Next, register the global 'console' object.
	 */
	duk_push_c_function(ctx, dukopen_console, 0 /*nargs*/);
	duk_call(ctx, 0);
	duk_put_global_string(ctx, "console");

	/* Connect the Duk context with the event loop. */
	loop->data = ctx;

	if (!check_flag && !print_flag) {
		if (source != NULL) {
			/* eval the contents of char *source */
			duk_eval_string(ctx, source);
			/*
			 * TODO: We might be able to oppportunistically
			 * free(source) and save some memory once the
			 * interpreter is running.
			 */
			exit(EXIT_SUCCESS);
		} else {
			/* We should never get here. */
			fprintf(stderr, "An unknown error occurred!\n");
			exit(EXIT_FAILURE);
		}
	} else {
		fprintf(stderr, "-c and -p are currently unimplemented.\n");
		mn_short_help();
		exit(EXIT_FAILURE);
	}

	/* TODO: Support check_flag and print_flag */

	duk_destroy_heap(ctx);
	free(source);
	uv_loop_close(loop);
	exit(EXIT_SUCCESS);
}
