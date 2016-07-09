#include <stdio.h>
#include "duktape.h"
#include "mininode.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'timers' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/timers.html
 */

duk_ret_t
timers_setImmediate(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_setInterval(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_setTimeout(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_clearImmediate(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_clearInterval(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_clearTimeout(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_ref(duk_context *ctx) {
	return 0;
}

duk_ret_t
timers_unref(duk_context *ctx) {
	return 0;
}

/* 
 * TODO: Implement ref() and unref() in the context of the above
 * TODO: Deterministic event firing order.
 */

duk_ret_t dukopen_timers(duk_context *ctx) {
	/* Push the global object onto the value stack */
	duk_push_global_object(ctx);
	/* Push the timer functions and JS function handles. */
	duk_push_c_function(ctx, timers_setImmediate, DUK_VARARGS);
	duk_put_global_string(ctx, "setImmediate");
	duk_push_c_function(ctx, timers_setInterval, DUK_VARARGS);
	duk_put_global_string(ctx, "setInterval");
	duk_push_c_function(ctx, timers_setTimeout, DUK_VARARGS);
	duk_put_global_string(ctx, "setTimeout");
	duk_push_c_function(ctx, timers_clearImmediate, 1);
	duk_put_global_string(ctx, "clearImmediate");
	duk_push_c_function(ctx, timers_clearInterval, 1);
	duk_put_global_string(ctx, "clearInterval");
	duk_push_c_function(ctx, timers_clearTimeout, 1);
	duk_put_global_string(ctx, "clearTimeout");

	return 1;
}
