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
	printf("Usage: node [options] [ -e script | script.js ] [arguments]\n"
               "       node debug script.js [arguments]\n");
}

int
main(int argc, char **argv) {

	duk_context *ctx = NULL; /* The heart of mininode! A duktape context. */
	char line[MAX_INPUT];    /* Reserved for the repl */
	int option_index;        /* Used by getopt_long. */
	int c;                   /* Also used by getopt_long. */
	int ch;                  /* Used by the repl. */
	char *filename = NULL;   /* Kinda self-explanatory. */
	
	/* If invoked without any arguments, we should invoke the REPL. */
	if (argc == 1) {
		printf("repl is currently unimplemented.\n");
	}

	static struct option long_options[] = {
		{"help",               no_argument, 0, 'h'},
		{"version",            no_argument, 0, 'v'},
		{"eval",               required_argument, &eval_flag, 'e'},
		{"print",              required_argument, &print_flag, 'p'},
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

	while (1) {
		c = getopt_long(argc, argv, OPTSTRING, long_options, &option_index);

		/* Detect the end of the options. */
		if (c == -1)
			break;


		switch (c) {
			case 'h':
				short_help();
				exit(EXIT_SUCCESS);
			case 'v':
				printf("Version %s\n", VERSION);
				exit(EXIT_SUCCESS);
			case 'e':
				if (!eval_flag) {
					eval_flag = 1;
					filename = optarg;
				} else {
					short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'p':
				if (!print_flag) {
					print_flag = 1;
				} else {
					short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'c':
				if (!check_flag) {
					check_flag = 1;
				} else {
					short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'i':
				interactive_flag = 99;
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
				short_help();
				exit(EXIT_FAILURE);
		}

	}

	/* 
	 * The last argument should be the filename unless -e was used.
	 */
	if (eval_flag == 0) {
		if (optind < argc) {
			/* If there is more than one remaining argument, exit. */
			if (argc - optind > 1) {
				short_help();
				exit(EXIT_FAILURE);
			}
			/* We'll try to use this file. */
			filename = argv[optind];
		}	
	}

	/* If we can't access the file, exit. */
	if (access(filename, R_OK) == -1) {
		fprintf(stderr, "Error: file not readable\n");
		exit(EXIT_FAILURE);
	}

	/*
	 * Need to add custom handlers here eventually.
	 * See http://duktape.org/api.html#duk_create_heap
	 */
	ctx = duk_create_heap_default();

	if (!ctx) {
		printf("Failed to create a Duktape heap!\n");
		exit(EXIT_FAILURE);
	}
	
	/* TODO: Register modules here. */

	if (eval_flag || !check_flag) {
		if (duk_peval_file(ctx, filename) != 0) {
			/* FIXME: This is wrong... */
			if ( print_flag ) {
				printf("%s\n", duk_safe_to_string(ctx, -1));
			}
        	}
	}

	/* TODO: Support check_flag */

	duk_destroy_heap(ctx);
	exit(0);
}