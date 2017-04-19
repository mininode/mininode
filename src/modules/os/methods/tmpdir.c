#include "duktape.h"
#include "mininode.h"
#include "uv.h"
#include <unistd.h>
#include <stdlib.h>

duk_ret_t
mn_bi_os_tmpdir(duk_context *ctx) {
	char buf[PATH_MAX];
	size_t len = sizeof(buf);

	/* Why isn't UV_OK defined...? */
	if (uv_os_tmpdir(buf, &len) == 0) {
		/*
		 * if (path.length > 1 && path.endsWith('/')) {
		 *     path = path.slice(0, -1);
		 * }
		 * 
		 * TODO: Check for trailing slash and remove it if found.
		 */
		duk_push_string(ctx, buf);
		return 1;
	} else {
		duk_push_string(ctx, "ERROR: mn_bi_os_tmpdir() failed!\n");
		duk_throw(ctx);
	}
}
