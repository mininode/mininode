#include <stdio.h>
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js debugger module functionality.
 *  See https://nodejs.org/dist/v6.9.2/docs/api/debugger.html
 */

/* Implementation TBD */

/*
 *  Module initialization
 */

const duk_function_list_entry mn_bi_debugger_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_debugger_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t
mn_bi_debugger(duk_context *ctx) {
	duk_push_global_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_debugger_funcs);
	duk_put_number_list(ctx, -1, mn_bi_debugger_consts);
	return 1;
}

