#include "duktape.h"
#include "uv.h"
#include "mininode.h"

duk_ret_t
mn_bi_os_uptime(duk_context *ctx) {
	double uptime;
	int err = uv_uptime(&uptime);
	if (err == 0) {
		duk_push_number(ctx, uptime);
		return 1;
	} else {
		duk_push_string(ctx, "uv_uptime() failed!");
		duk_throw(ctx);
	}
}
