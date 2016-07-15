#include "duktape.h"
#include <stdio.h>
#include <string.h>

duk_ret_t
mn_bi_util_format(duk_context *ctx, ...) {
	const int subs = duk_get_top(ctx) - 1; /* number of arguments minus one */
	const char *fmt = duk_require_string(ctx, 0); /* format string */
	const char *sub = NULL; /* substitution */
	int i; /* iterator */
	int f; /* format character */
	char *output; /* output string */
	size_t sz = strlen(fmt);
	
	/*
	 * Supported placeholders are (from the Node.js docs):
	 *
	 * %s - String.
	 * %d - Number (both integer and float).
	 * %j - JSON. Replaced with the string '[Circular]' if the
	 *      argument contains circular references.
	 * %% - single percent sign ('%'). This does not consume an argument.
	 *
	 * If the placeholder does not have a corresponding argument, the
	 * placeholder is not replaced. If there are more arguments passed to
	 * the util.format() method than the number of placeholders, the extra
	 * arguments are coerced into strings then concatenated to the returned
	 * string, each delimited by a space.
	 */

	/*
	 * We use negative i to go from left to right,
	 * and start at 1 to ignore fmt.
	 */
	for(i = 1; subs >= i; i++) {
		/* Grab the active substitution from the stack. */
		sub = duk_safe_to_string(ctx, -i);

		/*
		 * How do I get decent asymptotic performance here?
		 * I don't want to loop through the entire string for
		 * each substitution. That seems gratuitous.
		 */
		
		int f = 3; /* Random replacement */
		switch(f) {
			case 's':
				printf("String!\n");
			case 'd':
				printf("Number!\n");
			case 'j':
				printf("JSON!\n");
			case '%':
				printf("Percentage!\n");
		}
	}

	duk_push_string(ctx, "util.format doesn't work yet.");
	/* return 1 to indicate the return value is on the stack. */
	return 1;
}
