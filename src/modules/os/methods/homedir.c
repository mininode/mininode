#include "duktape.h"
#include "mininode.h"
#include "uv.h"
#include <unistd.h>

duk_ret_t mn_bi_os_homedir(duk_context *ctx) {
        char buf[PATH_MAX];
        size_t len = sizeof(buf);
        const int err = uv_os_homedir(buf, &len);
	
	if (err) {
		duk_push_string(ctx, "uv_os_homedir() error!");
		duk_throw(ctx);
	}

	duk_push_string(ctx, buf);
	return 1;
}
