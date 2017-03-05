#include <stdio.h>
#include "duktape.h"
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'timers' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/timers.html
 */

duk_ret_t
mn_bi_timers_ref(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_timers_unref(duk_context *ctx) {
	return 0;
}

duk_ret_t
mn_bi_timers(duk_context *ctx) {
	/* Push the global object onto the value stack */
	duk_push_global_object(ctx);
	/* Push the timer functions and JS function handles. */
	duk_push_c_function(ctx, mn_bi_timers_set_immediate, DUK_VARARGS);
	duk_put_global_string(ctx, "setImmediate");
	duk_push_c_function(ctx, mn_bi_timers_set_interval, DUK_VARARGS);
	duk_put_global_string(ctx, "setInterval");
	duk_push_c_function(ctx, mn_bi_timers_set_timeout, DUK_VARARGS);
	duk_put_global_string(ctx, "setTimeout");
	duk_push_c_function(ctx, mn_bi_timers_clear_immediate, 1);
	duk_put_global_string(ctx, "clearImmediate");
	duk_push_c_function(ctx, mn_bi_timers_clear_interval, 1);
	duk_put_global_string(ctx, "clearInterval");
	duk_push_c_function(ctx, mn_bi_timers_clear_timeout, 1);
	duk_put_global_string(ctx, "clearTimeout");
	duk_pop(ctx);

	return 0;
}
