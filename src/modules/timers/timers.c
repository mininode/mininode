#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'timers' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/timers.html
 */

/* Implementation TBD */

/*
 *  Module initialization
 */

const duk_function_list_entry timers_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry timers_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t dukopen_timers(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, timers_funcs);
	duk_put_number_list(ctx, -1, timers_consts);
	return 1;
}
