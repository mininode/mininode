#include <stdio.h>
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'http2' module functionality.
 *  See https://nodejs.org/docs/latest-v13.x/api/http2.html
 */

/* Implementation TBD */

/*
 *  Module initialization
 */

const duk_function_list_entry mn_bi_http2_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_http2_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t
mn_bi_http2(duk_context *ctx) {
	duk_push_global_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_http2_funcs);
	duk_put_number_list(ctx, -1, mn_bi_http2_consts);
	return 1;
}
