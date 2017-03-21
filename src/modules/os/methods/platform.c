#include "duktape.h"
#include "mininode.h"

/* TODO: Support other platforms */

duk_ret_t
mn_bi_os_platform(duk_context *ctx) {
#if defined(__linux__)
	duk_push_string(ctx, "linux");
#elif defined(__APPLE__)
	duk_push_string(ctx, "darwin");
#endif
	return 1;
}
