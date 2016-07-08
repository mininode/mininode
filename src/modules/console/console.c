#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 * Duktape/C functions providing Node.js 'console' module functionality.
 * See https://nodejs.org/dist/v6.2.2/docs/api/console.html
 */

duk_ret_t console_log(duk_context *ctx) {
	const char *str = duk_safe_to_string(ctx, -1);
	printf("%s\n", str);
	return 0;
}

/*
 *  Module initialization
 */

const duk_function_list_entry console_funcs[] = {
	{ "log", console_log, 1 /*nargs*/ },
	{ NULL, NULL, 0 }
};

const duk_number_list_entry console_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t dukopen_console(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, console_funcs);
	duk_put_number_list(ctx, -1, console_consts);
	return 1;
}

