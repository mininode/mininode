#include "duktape.h"
#include <stdio.h>
#include <string.h>

duk_ret_t
mn_bi_util_format(duk_context *ctx) {
	const int subs = duk_get_top(ctx) - 1; /* nargs minus 1 */
	const char *fmt = duk_require_string(ctx, 0); /* format string */
	const int fmtlen = strlen(fmt); /* Length of the format string */
	int subsused = 0; /* Number of substitutions used */
	const char *sub = NULL; /* An active substitution */
	int i; /* iterator */
	int f; /* format character */
	char *output; /* output string */
	size_t fmtsz = 0; /* size of format string */
	
	/*
	 * Supported placeholders are (from the Node.js docs):
	 *
	 * %s - String.
	 * %d - Number (both integer and float).
	 * %j - JSON. Replaced with the string '[Circular]' if the
	 *      argument contains circular references.
	 * %% - single percent sign ('%'). This does not consume an arg.
	 *
	 * If the placeholder does not have a corresponding argument,
	 * the placeholder is not replaced. If there are more arguments
	 * passed to util.format() than there are placeholders, the extra
	 * arguments are coerced into strings then concatenated to the
	 * returned string, each delimited by a space.
	 */

	for (i = 0; i < fmtlen; i++) {
		if (fmt[i] == '%') {
			printf("Format detected\n");
			switch(fmt[i+1]) {
				case 's':
					printf("String!\n");
					break;
				case 'd':
					printf("Number!\n");
					break;
				case 'j':
					printf("JSON!\n");
					break;
				case '%':
					printf("Percentage!\n");
					break;
			}
		}
		while (subs > subsused) {
			/* We have unused substitutions. */
			subsused++;
		}
	}
 
	/*
	 * We use negative i to go from left to right, and start at 1 
	 * to ignore the format string.
	 *
	 * Note that Javascript effectively has no limit on
	 * the number of arguments a function can take, so 
	 * this function is less optimal than it could be.
	 */
	for(i = 1; subs >= i; i++) {
		/*
		 * First, grab the active substitution from the stack.
		 * Note that we're using negative i!
		 * 
		 * Also note that duk_to_string() can raise an error.
		 */
		sub = duk_safe_to_string(ctx, -i);
	}

	duk_push_string(ctx, "util.format doesn't work yet.");
	/* return 1 to indicate the return value is on the stack. */
	return 1;
}
