#include "duktape.h"
#include <stdio.h>
#include <stdarg.h>

duk_ret_t
mn_bi_internal_format(duk_context *ctx, format, ...) {
	va_list ap;
	
	va_start(ap, ctx);
	duk_push_vsprintf(ctx, format, ap);
	va_end(ap);
}

duk_ret_t
mn_bi_util_format(duk_context *ctx) {
	const char *format = duk_require_string(ctx, -1);
	const int nargs = duk_get_top(ctx);
	
	while(nargs > 0) {
		
	}

	mn_bi_internal_format(ctx, format);
	return 1;
}
