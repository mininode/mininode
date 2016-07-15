#include "duktape.h"
#include <unistd.h>

/*
 * We get the following duk stack arguments:
 *
 * index -3: path <String> | <Buffer>
 * index -2: uid <Integer>
 * index -1: gid <Integer>
 */

duk_ret_t
mn_bi_fs_chown_sync(duk_context *ctx) {
	/*
	 * Invoking with less than three arguments will raise an error:
	 * TypeError: number required, found undefined (stack index -1)
	 */
	const char *path = duk_require_string(ctx, -3);
	const int uid = duk_require_int(ctx, -2);
	const int gid = duk_require_int(ctx, -1);

	int result = chown(path, uid, gid);
	if (result != -1) {
		/* On success, we don't return anything on the stack. */
		return 0;
	} else {
		printf("FIXME: Error!\n");
		/* TODO: On failure, raise Error and return it on the stack. */
		return 1;
	}
}
