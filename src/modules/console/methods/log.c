#include "duktape.h"
#include "mininode.h"
#include <stdio.h>

duk_ret_t
mn_bi_console_log(duk_context *ctx) {
	int nargs = duk_get_top(ctx);
	
	/* Mimic Node.js behavior when passed nothing. */
	if (nargs == 0) {
		puts("");
		return 0;
	}

	const char *str = duk_safe_to_string(ctx, -1);
	fprintf(stdout, "%s\n", str);
	return 0;
}
