#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'path' module functionality.
 *  See paths://nodejs.org/dist/v6.2.2/docs/api/path.html
 */

/*
 *  Module initialization
 */
const duk_function_list_entry path_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry path_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t dukopen_path(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, path_funcs);
	duk_put_number_list(ctx, -1, path_consts);
	return 1;
}
