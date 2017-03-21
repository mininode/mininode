#include "duktape.h"
#include "mininode.h"
#include "uv.h"

duk_ret_t
mn_bi_os_tmpdir(duk_context *ctx) {
	char  *buf = NULL;
	size_t len = 0;

	uv_os_tmpdir(buf, &len);

	if (buf) {
		duk_push_string(ctx, buf);
		return 1;
	} else {
		duk_push_string(ctx, "uv_os_tmpdir() failed!");
		duk_throw(ctx);
	}
}
