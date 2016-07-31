#include "duktape.h"
#include "uv.h"
#include "mininode.h"

duk_ret_t mn_bi_os_freemem(duk_context *ctx) {
	double amount = uv_get_free_memory();
	if (amount >= 0) {
		duk_push_number(ctx, amount);
		return 1;
	} else {
		duk_push_string(ctx, "freemem() failed!");
		duk_throw(ctx);
	}
}
