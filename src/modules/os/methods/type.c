#include "duktape.h"
#include "mininode.h"

/* TODO: Support other POSIX systems. */

duk_ret_t mn_bi_os_type(duk_context *ctx) {
#if defined(__linux)
	duk_push_string(ctx, "Linux");
#elif defined(__APPLE__)
	duk_push_string(ctx, "Darwin");
#else
	duk_push_string(ctx, "Unknown");
#endif
	return 1;
}
