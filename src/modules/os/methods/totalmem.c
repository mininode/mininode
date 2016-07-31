#include "duktape.h"
#include "uv.h"
#include "mininode.h"

duk_ret_t mn_bi_os_totalmem(duk_context *ctx) {
	double amount = uv_get_total_memory();
	if (amount > 0) {
		duk_push_number(ctx, amount);
		return 1;
	} else {
		duk_push_string(ctx, "totalmem() failed!");
		duk_throw(ctx);
	}
}
