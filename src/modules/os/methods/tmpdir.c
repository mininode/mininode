#include "duktape.h"
#include "mininode.h"

duk_ret_t mn_bi_os_tmpdir(duk_context *ctx) {
	duk_push_string(ctx, "/tmp");
	return 1;
}