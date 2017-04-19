#include <stdio.h>
#include "duktape.h"
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'os' module functionality.
 *  See https://nodejs.org/dist/v6.9.2/docs/api/os.html
 */

/*
 *  Module initialization
 */
const duk_function_list_entry mn_bi_os_funcs[] = {
	{ "arch",       mn_bi_os_arch,        0         },
	{ "cpus",       mn_bi_os_cpus,        0         },
	{ "endianness", mn_bi_os_endianness,  0         },
	{ "freemem",    mn_bi_os_freemem,     0         },
	{ "homedir",    mn_bi_os_homedir,     0         },
	{ "hostname",   mn_bi_os_hostname,    0         },
	{ "loadavg",    mn_bi_os_loadavg,     0         },
	{ "networkInterfaces", mn_bi_os_network_interfaces, 0},
	{ "platform",   mn_bi_os_platform,    0         },
	{ "release",    mn_bi_os_release,     0         },
	{ "tmpdir",     mn_bi_os_tmpdir,      0         },
	{ "totalmem",   mn_bi_os_totalmem,    0         },
	{ "type",       mn_bi_os_type,        0         },
	{ "uptime",     mn_bi_os_uptime,      0         },
	{ "user_info",  mn_bi_os_user_info,   0         },
	{ NULL, NULL, 0 }
};

duk_ret_t
mn_bi_os(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, 1, mn_bi_os_funcs);
	/* 
	 * This sets the 'EOL' property on the 'os' objet. Since we only 
	 * support POSIX systems, this is always an '\n'
	 */
	duk_push_string(ctx, "EOL");
	duk_push_string(ctx, "\n");
	duk_put_prop(ctx, 1);
	return 1;
}
