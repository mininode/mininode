#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'os' module functionality.
 *  See oss://nodejs.org/dist/v6.2.2/docs/api/os.html
 */

/*
 *  Module initialization
 */
const duk_function_list_entry mn_bi_os_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_os_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t mn_bi_os(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_os_funcs);
	duk_put_number_list(ctx, -1, mn_bi_os_consts);
	return 1;
}
