#include "mininode.h"
#include <unistd.h>

duk_ret_t
mn_bi_fs_access(duk_context *ctx) {
	const int nargs = duk_get_top(ctx);
	const char *path = NULL;
	uv_fs_t *req = NULL;
	int mode = 0;

	if (nargs == 2) {
		mode = F_OK | R_OK;
		path = duk_require_string(ctx, -2);
	} else if (nargs == 3) {
		mode = duk_require_int(ctx, -2);
		path = duk_require_string(ctx, -3);
	} else if (nargs < 2 || nargs > 3) {
		duk_pop_n(ctx, nargs);
		duk_push_error_object(
			ctx,
			DUK_ERR_TYPE_ERROR,
			"invalid arguments"
		);
		duk_push_string(ctx, "src/modules/fs/methods/access.c");
		duk_put_prop_string(ctx, -2, "fileName");
		duk_push_int(ctx, 17); /* Blame line #17. */
		/*
		 * Blaming the branch will provide the info necessary
		 * to actually fix the bug in user code, e.g., it is
		 * kinda obvious that (nargs < 2 || nargs > 3) was 
		 * the underlying issue for the exception.
		 */
		duk_put_prop_string(ctx, -2, "lineNumber");
		/*
		 * All Error objects should set fileName & lineNumber.
		 * This is a bit of a maintenance nightmare, but I feel
		 * it's worth the effort to maintain this convention.
		 */
		duk_throw(ctx);
		/*
		 * Note that we can't really return after we throw.
		 * Return values are used to indicate the depth of
		 * the return value stack. It's a meta thing, okay?
		 */
		return 1;
	}

	req = duk_push_fixed_buffer(ctx, sizeof(*req));
	req->data = mn_setup_req(ctx, -2);
	uv_fs_access(mn_loop, req, path, mode, mn_fs_cb);

	if (req->result != 0) { 
		mn_push_error_result(ctx, req);
		duk_throw(ctx);
		return 1;
	} else {
		return 0;
	}
}
