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
#include <string.h>
#include <limits.h>
#include <getopt.h>
#include "duktape.h"

#define VERSION "0.0.1"

/* Accepted flags for getopt_long() */
#define OPTSTRING "chipvz"
/* Flag set by -p */
static int print_flag = 0;
/* Flag set by -c */
static int check_flag = 0;
/* Flag set by -i */
static int interactive_flag = 0;
/* Flag set by --z */
static int zero_fill_flag = 0;

static void
short_help() {
	printf("Usage: mininode [options] script.js\n");
}

duk_ret_t
mininode_mod_search(duk_context *ctx) {
	/* We get the following duk stack arguments:
	 *   index 0: id
	 *   index 1: require
	 *   index 2: exports
	 *   index 3: module
	 *
	 * For built-in modules, we need to map from, e.g., 'v8' to 
	 * dukopen_v8. This needs to happen quickly, ideally O(1), due
	 * to the fact that it is the first step in module loading.
	 */
}

int
main(int argc, char **argv) {

	duk_context *ctx = NULL; /* The heart of mininode! A duktape context. */
	char line[MAX_INPUT];    /* Reserved for the repl */
	int c;                   /* Used by getopt. */
	int ch;                  /* Used by the repl. */
	char *filename = NULL;   /* Kinda self-explanatory. */
	
	/* If invoked without any arguments, we should invoke the REPL. */
	if (argc == 1) {
		printf("repl is currently unimplemented.\n");
		short_help();
		exit(EXIT_FAILURE);
	}

	while ((c = getopt(argc, argv, OPTSTRING)) != -1) {
		switch (c) {
			case 'h':
				short_help();
				exit(EXIT_SUCCESS);
			case 'v':
				printf("Version %s\n", VERSION);
				exit(EXIT_SUCCESS);
			case 'p':
				if (print_flag == 0) {
					print_flag = 1;
				} else {
					short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'c':
				if (check_flag == 0) {
					check_flag = 1;
				} else {
					short_help();
					exit(EXIT_FAILURE);
				}
				break;
			case 'i':
				interactive_flag = 1;
				break;
			case 'z':
				zero_fill_flag = 1;
				break;
			default:
				short_help();
				exit(EXIT_FAILURE);
		}

	}

	/* 
	 * The last argument should be the filename.
	 */
	filename = argv[argc-1];

	/* If we can't access the file, exit. */
	if (access(filename, R_OK) == -1) {
		fprintf(stderr, "Error: file not readable\n");
		short_help();
		exit(EXIT_FAILURE);
	}

	/*
	 * Need to add custom handlers here eventually.
	 * See http://duktape.org/api.html#duk_create_heap
	 * 
	 * This might be an interesting place to use portableumem.
	 */
	ctx = duk_create_heap_default();

	if (!ctx) {
		printf("Failed to create a Duktape heap!\n");
		exit(EXIT_FAILURE);
	}
	
	/*
	 * Register our module loader with the Duktape context.
	 */
	duk_get_global_string(ctx, "Duktape");
	duk_push_c_function(ctx, mininode_mod_search, 4 /*nargs*/);
	duk_put_prop_string(ctx, -2, "modSearch");
	duk_pop(ctx);
	
	/* TODO: Register always loaded modules here (e.g., 'console'). */

	if (zero_fill_flag) {
		fprintf(stderr, "-z is currently unimplemented.");
		short_help();
		exit(EXIT_FAILURE);
	}

	if (!check_flag && !print_flag) {
		if (duk_peval_file(ctx, filename) != 0) {
			printf("%s\n", duk_safe_to_string(ctx, -1));
        	}
	} else {
		fprintf(stderr, "-c and -p are currently unimplemented.\n");
		short_help();
		exit(EXIT_FAILURE);
	}

	/* TODO: Support check_flag and print_flag */

	duk_destroy_heap(ctx);
	exit(0);
}