#include "duktape.h"
#include "mininode.h"
#include <sys/utsname.h>

duk_ret_t
mn_bi_os_release(duk_context *ctx) {
	struct utsname un;
	if (uname(&un) == 0) {
		duk_push_string(ctx, un.release);
		return 1;
	} else {
		duk_push_string(ctx, "uname() failed!");
		duk_throw(ctx);
	}
	return 0;
}