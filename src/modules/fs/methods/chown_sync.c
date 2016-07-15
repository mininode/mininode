#include "duktape.h"
#include <unistd.h> /* for chown() */
#include <string.h> /* for strlen() */
#include <errno.h>

/*
 * We get the following duk stack arguments:
 *
 * index -3: path <String> | <Buffer>
 * index -2: uid <Integer>
 * index -1: gid <Integer>
 */

duk_ret_t
mn_bi_fs_chown_sync(duk_context *ctx) {
	const char *path = duk_require_string(ctx, -3);
	const int uid = duk_require_int(ctx, -2);
	const int gid = duk_require_int(ctx, -1);
	duk_idx_t err_idx;
	int result;

	/*
	 * Invoking with less than three arguments will raise an error:
	 * TypeError: number required, found undefined (stack index -1)
	 */

	result = chown(path, uid, gid);

	if (result != -1) {
		/* On success, we don't return anything on the stack. */
		return 0;
	} else {
		/*
		 * TODO: Raise Node.js compliant errors.
		 * { [Error: EPERM: operation not permitted, chown '/wat']
		 * errno: -1,
		 * code: 'EPERM',
		 * syscall: 'chown',
		 * path: '/wat' }
		 */
		err_idx = duk_push_error_object(
			ctx,
			DUK_ERR_API_ERROR,
			"chown() returned error: %d",
			errno
		);
		duk_throw(ctx);
		return 1;
	}
}
