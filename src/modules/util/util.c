#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'util' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/util.html
 */

duk_ret_t
mn_bi_util_debuglog(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_util_deprecate(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_util_format(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_util_inherits(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_util_inspect(duk_context *ctx) {
	return 0;
}

/*
 *  Module initialization
 */
const duk_function_list_entry mn_bi_util_funcs[] = {
	{ "debuglog",  mn_bi_util_debuglog,  1 /*nargs*/ },
	{ "deprecate", mn_bi_util_deprecate, 2           },
	{ "format",    mn_bi_util_format,    DUK_VARARGS },
	{ "inherits",  mn_bi_util_inherits,  2           },
	{ "inspect",   mn_bi_util_inspect,   DUK_VARARGS },
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_util_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t mn_bi_util(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_util_funcs);
	duk_put_number_list(ctx, -1, mn_bi_util_consts);
	return 1;
}
