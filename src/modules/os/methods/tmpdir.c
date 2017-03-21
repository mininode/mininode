#include "duktape.h"
#include "mininode.h"
#include "uv.h"

duk_ret_t
mn_bi_os_tmpdir(duk_context *ctx) {
	char  *buf = NULL;
	size_t len = NULL;

	uv_os_tmpdir(buf, len);

	duk_push_string(ctx, buf);
	return 1;
}