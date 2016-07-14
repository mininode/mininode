#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'process' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/process.html
 */

/*
 *  Module initialization
 */
const duk_function_list_entry mn_bi_process_funcs[] = {
	{ "abort",       mn_bi_process_abort,        0         },
	{ "arch",        mn_bi_process_arch,         0         },
	{ "argv",        mn_bi_process_argv,         0         },
	{ "chdir",       mn_bi_process_chdir,        1         },
	{ "config",      mn_bi_process_config,       0         },
	{ "connected",   mn_bi_process_connected,    0         },
	{ "cpuUsage",    mn_bi_process_cpu_usage,   DUK_VARARGS},
	{ "cwd",         mn_bi_process_cwd,          0         },
	{ "disconnect",  mn_bi_process_disconnect,   0         },
	{ "env",         mn_bi_process_env,          0         },
	{ "emitWarning", mn_bi_process_emit_warning, 0         },
	{ "execArgv",    mn_bi_process_exec_argv,    0         },
	{ "execPath",    mn_bi_process_exec_path,    0         },
	{ "exit",        mn_bi_process_exit,        DUK_VARARGS},
	{ "getegid",     mn_bi_process_getegid,      0         },
	{ "geteuid",     mn_bi_process_geteuid,      0         },
	{ "getgid",      mn_bi_process_getgid,       0         },
	{ "getgroups",   mn_bi_process_getgroups,    0         },
	{ "getuid",      mn_bi_process_getuid,       0         },
	{ "hrtime",      mn_bi_process_hrtime,      DUK_VARARGS},
	{ "initgroups",  mn_bi_process_initgroups,   2         },
	{ "kill",        mn_bi_process_kill,        DUK_VARARGS},
	{ "mainModule",  mn_bi_process_main_module,  0         },
	{ "memoryUsage", mn_bi_process_memory_usage, 0         },
	{ "nextTick",    mn_bi_process_next_tick,    0         },
	{ "pid",         mn_bi_process_pid,          0         },
	{ "platform",    mn_bi_process_platform,     0         },
	{ "release",     mn_bi_process_release,      0         },
	{ "send",        mn_bi_process_send,         0         },
	{ "setegid",     mn_bi_process_setegid,      0         },
	{ "seteuid",     mn_bi_process_seteuid,      0         },
	{ "setgid",      mn_bi_process_setgid,       0         },
	{ "setgroups",   mn_bi_process_setgroups,    0         },
	{ "setuid",      mn_bi_process_setuid,       0         },
	{ "umask",       mn_bi_process_umask,        0         },
	{ "uptime",      mn_bi_process_uptime,       0         },
	{ "version",     mn_bi_process_version,      0         },
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_process_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t
mn_bi_process(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_process_funcs);
	duk_put_number_list(ctx, -1, mn_bi_process_consts);
	duk_put_global_string(ctx, "process");
	return 1;
}
