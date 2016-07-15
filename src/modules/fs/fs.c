#include <stdio.h>
#include "duktape.h"
#include "modules.h"

/*
 *  Duktape/C functions providing Node.js 'fs' module functionality.
 *  See https://nodejs.org/dist/v6.2.2/docs/api/fs.html
 */

/*
 *  Module initialization
 * TODO: FS.constants
 */
const duk_function_list_entry mn_bi_fs_funcs[] = {
	{ "access",            mn_bi_fs_access,              DUK_VARARGS},
	{ "accessSync",        mn_bi_fs_access_sync,         DUK_VARARGS},
	{ "appendFile",        mn_bi_fs_append_file,         DUK_VARARGS},
	{ "appendFileSync",    mn_bi_fs_append_file_sync,    DUK_VARARGS},
	{ "chmod",             mn_bi_fs_chmod,               3          },
	{ "chmodSync",         mn_bi_fs_chmod_sync,          2          },
	{ "chown",             mn_bi_fs_chown,               4          },
	{ "chownSync",         mn_bi_fs_chown_sync,          3          },
	{ "close",             mn_bi_fs_close,               2          },
	{ "closeSync",         mn_bi_fs_close_sync,          1          },
	{ "createReadStream",  mn_bi_fs_create_read_stream,  DUK_VARARGS},
	{ "createWriteStream", mn_bi_fs_create_write_stream, DUK_VARARGS},
	{ "fchmod",            mn_bi_fs_fchmod,              3          },
	{ "fchmodSync",        mn_bi_fs_fchmod_sync,         2          },
	{ "fchown",            mn_bi_fs_fchown,              4          },
	{ "fchownSync",        mn_bi_fs_fchown_sync,         3          },
	{ "fdatasync",         mn_bi_fs_fdatasync,           2          },
	{ "fdatasyncSync",     mn_bi_fs_fdatasync_sync,      1          },
	{ "fstat",             mn_bi_fs_fstat,               2          },
	{ "fstatSync",         mn_bi_fs_fstat_sync,          1          },
	{ "fsync",             mn_bi_fs_fsync,               2          },
	{ "fsyncSync",         mn_bi_fs_fsync_sync,          1          },
	{ "ftruncate",         mn_bi_fs_ftruncate,           3          },
	{ "ftruncateSync",     mn_bi_fs_ftruncate_sync,      2          },
	{ "futimes",           mn_bi_fs_utimes,              4          },
	{ "futimesSync",       mn_bi_fs_utimes_sync,         3          },
	{ "lchmod",            mn_bi_fs_lchmod,              3          },
	{ "lchmodSync",        mn_bi_fs_lchmod_sync,         2          },
	{ "lchown",            mn_bi_fs_lchown,              4          },
	{ "lchownSync",        mn_bi_fs_lchown_sync,         3          },
	{ "link",              mn_bi_fs_link,                3          },
	{ "linkSync",          mn_bi_fs_link_sync,           2          },
	{ "lstat",             mn_bi_fs_lstat,               2          },
	{ "lstatSync",         mn_bi_fs_lstat_sync,          1          },
	{ "mkdir",             mn_bi_fs_mkdir,               DUK_VARARGS},
	{ "mkdirSync",         mn_bi_fs_mkdir_sync,          DUK_VARARGS},
	{ "mkdtemp",           mn_bi_fs_mkdtemp,             2          },
	{ "mkdtempSync",       mn_bi_fs_mkdtemp_sync,        1          },
	{ "open",              mn_bi_fs_open,                DUK_VARARGS},
	{ "openSync",          mn_bi_fs_open_sync,           DUK_VARARGS},
	{ "read",              mn_bi_fs_read,                6          },
	{ "readdir",           mn_bi_fs_readdir,             DUK_VARARGS},
	{ "readdirSync",       mn_bi_fs_readdir_sync,        DUK_VARARGS},
	{ "readFile",          mn_bi_fs_read_file,           DUK_VARARGS},
	{ "readFileSync",      mn_bi_fs_read_file_sync,      DUK_VARARGS},
	{ "readlink",          mn_bi_fs_readlink,            DUK_VARARGS},
	{ "readlinkSync",      mn_bi_fs_readlink_sync,       DUK_VARARGS},
	{ "readSync",          mn_bi_fs_read_sync,           5          },
	{ "realpath",          mn_bi_fs_realpath,            DUK_VARARGS},
	{ "realpathSync",      mn_bi_fs_realpath_sync,       DUK_VARARGS},
	{ "rename",            mn_bi_fs_rename,              DUK_VARARGS},
	{ "renameSync",        mn_bi_fs_rename_sync,         DUK_VARARGS},
	{ "rmdir",             mn_bi_fs_rmdir,               2          },
	{ "rmdirSync",         mn_bi_fs_rmdir_sync,          1          },
	{ "stat",              mn_bi_fs_stat,                2          },
	{ "statSync",          mn_bi_fs_stat_sync,           1          },
	{ "symlink",           mn_bi_fs_symlink,             DUK_VARARGS},
	{ "symlinkSync",       mn_bi_fs_readlink_sync,       DUK_VARARGS},
	{ "truncate",          mn_bi_fs_truncate,            3          },
	{ "truncateSync",      mn_bi_fs_truncate_sync,       2          },
	{ "unlink",            mn_bi_fs_unlink,              2          },
	{ "unlinkSync",        mn_bi_fs_unlink_sync,         1          },
	{ "unwatchFile",       mn_bi_fs_unwatch_file,        DUK_VARARGS},
	{ "utimes",            mn_bi_fs_utimes,              4          },
	{ "utimesSync",        mn_bi_fs_utimes_sync,         3          },
	{ "watch",             mn_bi_fs_watch,               DUK_VARARGS},
	{ "watchFile",         mn_bi_fs_watch_file,          DUK_VARARGS},
	{ "write",             mn_bi_fs_write,               DUK_VARARGS},
	{ "writeFile",         mn_bi_fs_write_file,          DUK_VARARGS},
	{ "writeFileSync",     mn_bi_fs_write_file_sync,     DUK_VARARGS},
	{ "writeSync",         mn_bi_fs_write_sync,          DUK_VARARGS},
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_fs_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t mn_bi_fs(duk_context *ctx) {
	duk_bool_t ret = NULL;
	duk_push_object(ctx);
	duk_put_function_list(ctx, -3, mn_bi_fs_funcs);
	duk_put_number_list(ctx, -3, mn_bi_fs_consts);
	ret = duk_put_prop_string(ctx, -3, "fs");
	duk_pop(ctx);
	return ret;
}
