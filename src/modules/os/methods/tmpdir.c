#include "duktape.h"
#include "mininode.h"
#include "uv.h"
#include <unistd.h>

duk_ret_t
mn_bi_os_tmpdir(duk_context *ctx) {
	char buf[PATH_MAX];
	size_t len = sizeof(buf);

	uv_os_tmpdir(buf, &len);

	if (buf) {
		duk_push_string(ctx, buf);
		return 1;
	} else {
		duk_push_string(ctx, "uv_os_tmpdir() failed!");
		duk_throw(ctx);
	}
}
