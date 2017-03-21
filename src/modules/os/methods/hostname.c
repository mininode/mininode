#include "duktape.h"
#include "mininode.h"
#include <limits.h>      /* PATH_MAX on Solaris. */
#include <netdb.h>       /* MAXHOSTNAMELEN on Solaris. */
#include <unistd.h>      /* gethostname, sysconf */
#include <sys/param.h>   /* MAXHOSTNAMELEN on Linux and the BSDs. */

duk_ret_t
mn_bi_os_hostname(duk_context *ctx) {
	char buf[MAXHOSTNAMELEN + 1];
	if (gethostname(buf, sizeof(buf))) {
		duk_push_string(ctx, "gethostname() failed!");
		duk_throw(ctx);
	} else {
		buf[sizeof(buf) - 1] = '\0';
		duk_push_string(ctx, buf);
		return 1;
	}
}
