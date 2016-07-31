#include "duktape.h"
#include "mininode.h"
#include <unistd.h>
#include <pwd.h>

duk_ret_t mn_bi_os_homedir(duk_context *ctx) {
	struct passwd *pwent = getpwuid(getuid());
	duk_push_string(ctx, pwent->pw_dir);
	return 1;
}
