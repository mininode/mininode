#include <stdio.h>
#include "duktape.h"
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'util' module functionality.
 *  See https://nodejs.org/dist/v6.9.2/docs/api/util.html
 */

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

duk_ret_t
mn_bi_util(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -3, mn_bi_util_funcs);
	duk_put_number_list(ctx, -3, mn_bi_util_consts);
	return 1;
}
