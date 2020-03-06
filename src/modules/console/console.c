#include <stdio.h>
#include "mininode.h"

/*
 * Duktape/C functions providing Node.js 'console' module functionality.
 * See https://nodejs.org/dist/v6.9.2/docs/api/console.html
 */

duk_ret_t
mn_bi_console_constructor(duk_context *ctx) {

	/* Must be called as a constructor. */
	if (!duk_is_constructor_call(ctx)) {
		return DUK_RET_TYPE_ERROR;
	}

	int nargs = duk_get_top(ctx);
	duk_set_top(ctx, 1);
	duk_push_this(ctx);

	if (nargs == 0) {

	}

	return 0;
}

/*
 *  Module initialization
 */

const duk_function_list_entry mn_bi_console_funcs[] = {
	{ "log", mn_bi_console_log, DUK_VARARGS /*nargs*/ },
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_console_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t
mn_bi_console(duk_context *ctx) {
	duk_idx_t console_idx = duk_push_object(ctx);
	duk_put_function_list(ctx, console_idx, mn_bi_console_funcs);
	duk_put_number_list(ctx, console_idx, mn_bi_console_consts);
	duk_put_global_string(ctx, "console");

	/*
	 * Proxy wrapping: ensures any undefined console method calls are
	 * ignored silently.  This is required specifically by the
	 * DeveloperToolsWG proposal (and is implemented by Firefox):
	 * https://bugzilla.mozilla.org/show_bug.cgi?id=629607).
	 *
	 */
	duk_peval_string_noresult(ctx,
		"(function(){"
		    "var D=function(){};"
		    "console=new Proxy(console,{"
		        "get:function(t,k){"
		            "var v=t[k];"
		            "return typeof v==='function'?v:D;"
		        "}"
		    "});"
		"})();"
	);

	return 0;
}

