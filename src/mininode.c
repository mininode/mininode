/**
 * mininode - Node.js for Embedded Systems.
 *
 * Copyright (c) 2016 Alex Caudill. All rights reserved.
 *
 * See LICENSE.txt for the MIT license.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <string.h>
#include <limits.h>
#include <getopt.h>
#include "duktape.h"

#define VERSION "0.0.1"

/* Accepted flags for getopt_long() */
#define OPTSTRING "c:e:hipr:v"
/* Flag set by --eval */
static int eval_flag = 0;
/* Flag set by --print */
static int print_flag = 0;
/* Flag set by --check */
static int check_flag = 0;
/* Flag set by --interactive */
static int interactive_flag = 0;
/* Flag set by --require */
static int require_flag = 0;
/* Flag set by --no-deprecation */
static int no_depreca_flag = 0;
/* Flag set by --trace-deprecation */
static int trace_depreca_flag = 0;
/* Flag set by --trace-sync-io */
static int trace_sync_flag = 0;
/* Flag set by --track-heap-objects */
static int track_heap_flag = 0;
/* Flag set by --zero-fill-buffers */
static int zero_fill_flag = 0;

static void
short_help() {
	printf(
		"Usage: node [options] [ -e script | script.js ] [arguments]\n"
		"       node debug script.js [arguments]\n"
	);
}

static void
long_help() {
	printf(
		"\n"
		"Options:\n"
		"  -h, --help             print this help message."
		"  -v, --version          print MiniNode version.\n"
		"  -e, --eval <script>    evaluate script\n"
		"  -p, --print <script>   evaluate script and print result\n"
		"  -c, --check            syntax check script without executing\n"
		"  -i, --interactive      always enter the REPL even if stdin\n"
		"                         does not appear to be a terminal\n"
		"  -r, --require <module> module to preload (option can be repeated)\n"
		"  --no-deprecation       silence deprecation warnings\n"
		"  --trace-deprecation    show stack traces on deprecations\n"
		"  --throw-deprecation    throw exception if a deprecated function is used\n"
		"  --trace-sync-io        show stack trace when use of sync IO\n"
		"                         is detected after the first tick\n"
		"  --track-heap-objects   track heap object allocations for heap snapshots\n"
		"  --prof-process         process v8 profiler output generated"
		"                         using --prof (IGNORED)"
  		"  --zero-fill-buffers    automatically zero-fill all newly allocated\n"
                "                         Buffer and SlowBuffer instances\n"
                "  --v8-options           print v8 command line options (IGNORED)\n"
                "  --v8-pool-size=num     set thread pool size\n"
                "  --tls-cipher-list=val  use an alternative default TLS cipher list\n"
                "  --icu-data-dir=dir     set ICU data load path to dir (IGNORED)\n"
		"\n"
		"Environment variables:\n"
		"	NODE_PATH                ':'-separated list of directories\n"
		"	                         prefixed to the module search path.\n"
		"	NODE_DISABLE_COLORS      set to 1 to disable colors in the REPL\n"
		"	NODE_REPL_HISTORY        path to the persistent REPL history file\n"
	);
}

int
main(int argc, char **argv) {

	duk_context *ctx = NULL;        /* The heart of mininode! A duktape context. */
	char line[MAX_INPUT];           /* Reserved for the repl */
	int option_index;               /* getopt_long stores the option index here. */
	int c;                          /* Also used by getopt_long */
	int ch;                         /* Used by the repl */
	
	/* If invoked without any arguments, just invoke the REPL. */
	if (argc == 1) {
		printf("TBD\n");
	}

	static struct option long_options[] =
	{
		{"help",               no_argument, 0, 'h'},
		{"version",            no_argument, 0, 'v'},
		{"eval",               no_argument, &eval_flag, 'e'},
		{"print",              no_argument, &print_flag, 'p'},
		{"check",              no_argument, &check_flag, 'c'},
		{"interactive",        no_argument, &interactive_flag, 'i'},
		{"require",            no_argument, &require_flag,  'r'},
		{"no-deprecation",     no_argument, &no_depreca_flag, 0},
		{"trace-deprecation",  no_argument, &trace_depreca_flag, 0},
		{"trace-sync-io",      no_argument, &trace_sync_flag, 0},
		{"track-heap-objects", no_argument, &track_heap_flag, 0},
		/* --prof-process is a no-op for compatibility. */
		{"prof-process",       no_argument, 0, 0},
		{"zero-fill-buffers",  no_argument, &zero_fill_flag, 0},
		/* --v8-options is a no-op for compatibility. */
		{"v8-options",         required_argument, 0, 0},
		{"v8-pool-size",       required_argument, 0, 0},
		{"tls-cipher-list",    required_argument, 0, 0},
		/* --icu-data-dir is a no-op for compatibility */ 
		{"icu-data-dir",       required_argument, 0, 0},
		{0, 0, 0, 0}
	};

	while (1) 
	{
		c = getopt_long(argc, argv, OPTSTRING, long_options, &option_index);

		/* Detect the end of the options. */
		if (c == -1)
			break;


		switch (c)
		{
			case 'h':
				short_help();
				long_help();
				exit(EXIT_SUCCESS);
			case 'v':
				printf("Version %s\n", VERSION);
				exit(EXIT_SUCCESS);
			case 'e':
				printf("blah e\n");
				break;
			case 'p':
				printf("blah p\n");
				break;
			case 'c':
				printf("blah c\n");
				break;
			case 'i':
				printf("blah i\n");
				break;
			case 'r':
				printf("blah r\n");
				break;
			case 0:
				/* The remaining long options just set flags. */
				if (long_options[option_index].flag != 0)
					//long_options[option_index].flag = 1;
					break;
			default:
				exit(EXIT_FAILURE);
		}

	}

	/* The remaining command line argument should be a filename. */
	if (optind < argc) {
		/* If there is more than one remaining argument, exit. */
		if (argc - optind > 1) {
			short_help();
			exit(EXIT_FAILURE);
		}
		if (access(argv[optind], R_OK) == -1) {
			fprintf(stderr, "Error: file not found\n");
			exit(EXIT_FAILURE);
		}
	}

	/*
	 * Need to add custom handlers here eventually.
	 * See http://duktape.org/api.html#duk_create_heap
	 */
	ctx = duk_create_heap_default();

	if (!ctx) {
		printf("Failed to create a Duktape heap!\n");
		exit(1);
	}
	
        if (duk_peval_file(ctx, argv[optind]) != 0) {
            printf("%s\n", duk_safe_to_string(ctx, -1));
        }


	duk_destroy_heap(ctx);
	exit(0);
}