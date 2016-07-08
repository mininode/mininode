#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js debugger module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/debugger.html
 */

/* Implementation TBD */

/*
 *  Module initialization
 */

const duk_function_list_entry debugger_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry debugger_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t dukopen_debugger(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, debugger_funcs);
	duk_put_number_list(ctx, -1, debugger_consts);
	return 1;
}

