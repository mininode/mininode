#include <stdio.h>
#include <unistd.h>
#include "duktape.h"
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'fs' module functionality.
 *  See https://nodejs.org/dist/v6.9.2/docs/api/fs.html
 */

/*
 * Utility functions
 */
void
mn_fs_cb(uv_fs_t *req) {
	duk_context *ctx = req->loop->data;
	int nargs;

	if (req->result < 0) {
		mn_push_error_result(ctx, req);
		duk_push_null(ctx);
		nargs = 2;
	} else {
		mn_push_fs_result(ctx, req);
		nargs = 1;
	}

	mn_fulfill_req(ctx, (uv_req_t *)req, nargs);

	if (req->fs_type != UV_FS_SCANDIR) {
		req->data = mn_cleanup_req(ctx, req->data);
		uv_fs_req_cleanup(req);
	}
}

void
mn_push_error_result(duk_context *ctx, uv_fs_t *req) {
	if (req->path) {
		duk_push_error_object(
			ctx,
			DUK_ERR_ERROR,
			"%s: %s: %s",
			uv_err_name(req->result),
			uv_strerror(req->result),
			req->path
		);
	} else {
		duk_push_error_object(
			ctx,
			DUK_ERR_ERROR,
			"%s: %s",
			uv_err_name(req->result),
			uv_strerror(req->result)
		);
	}
}

void
mn_push_timespec_table(duk_context *ctx, const uv_timespec_t *t) {
	duk_push_object(ctx);
	duk_push_uint(ctx, t->tv_sec);
	duk_put_prop_string(ctx, -2, "sec");
	duk_push_uint(ctx, t->tv_nsec);
	duk_put_prop_string(ctx, -2, "nsec");
}

void
mn_push_stats_table(duk_context *ctx, const uv_stat_t *s) {
	const char* type = NULL;
	duk_push_object(ctx);
	duk_push_uint(ctx, s->st_mode);
	duk_put_prop_string(ctx, -2, "mode");
	duk_push_uint(ctx, s->st_uid);
	duk_put_prop_string(ctx, -2, "uid");
	duk_push_uint(ctx, s->st_gid);
	duk_put_prop_string(ctx, -2, "gid");
	duk_push_uint(ctx, s->st_size);
	duk_put_prop_string(ctx, -2, "size");
	mn_push_timespec_table(ctx, &s->st_atim);
	duk_put_prop_string(ctx, -2, "atime");
	mn_push_timespec_table(ctx, &s->st_mtim);
	duk_put_prop_string(ctx, -2, "mtime");
	mn_push_timespec_table(ctx, &s->st_ctim);
	duk_put_prop_string(ctx, -2, "ctime");
	if (S_ISREG(s->st_mode)) {
		type = "file";
	}
	else if (S_ISDIR(s->st_mode)) {
		type = "directory";
	}
	else if (S_ISLNK(s->st_mode)) {
		type = "link";
	}
	else if (S_ISFIFO(s->st_mode)) {
		type = "fifo";
	}
	#ifdef S_ISSOCK
	else if (S_ISSOCK(s->st_mode)) {
		type = "socket";
	}
	#endif
	else if (S_ISCHR(s->st_mode)) {
		type = "char";
	}
	else if (S_ISBLK(s->st_mode)) {
		type = "block";
	}
	if (type) {
		duk_push_string(ctx, type);
		duk_put_prop_string(ctx, -2, "type");
	}
}

void
mn_push_fs_result(duk_context *ctx, uv_fs_t *req) {
	mn_req_t* data = req->data;
	char* chunk;

	switch (req->fs_type) {
		case UV_FS_ACCESS:
			duk_push_null(ctx);
			break;
		case UV_FS_CLOSE:
		case UV_FS_RENAME:
		case UV_FS_UNLINK:
		case UV_FS_RMDIR:
		case UV_FS_MKDIR:
		case UV_FS_FTRUNCATE:
		case UV_FS_FSYNC:
		case UV_FS_FDATASYNC:
		case UV_FS_LINK:
		case UV_FS_SYMLINK:
		case UV_FS_CHMOD:
		case UV_FS_FCHMOD:
		case UV_FS_CHOWN:
		case UV_FS_FCHOWN:
		case UV_FS_UTIME:
		case UV_FS_FUTIME:
			duk_push_boolean(ctx, 1);
			break;

		case UV_FS_OPEN:
		case UV_FS_SENDFILE:
		case UV_FS_WRITE:
			duk_push_uint(ctx, req->result);
			break;

		case UV_FS_STAT:
		case UV_FS_LSTAT:
		case UV_FS_FSTAT:
			mn_push_stats_table(ctx, &req->statbuf);
			break;

		case UV_FS_READLINK:
			duk_push_string(ctx, (char*)req->ptr);
			break;

		case UV_FS_MKDTEMP:
			duk_push_string(ctx, req->path);
			break;

		case UV_FS_READ:
			chunk = duk_push_fixed_buffer(ctx, req->result);
			memcpy(chunk, data->data, req->result);
			break;

		case UV_FS_SCANDIR:
			/* Expose the userdata for the request. */
			mn_push_ref(ctx, data->req_ref);
			break;

		default:
			duk_push_error_object(
				ctx,
				DUK_ERR_TYPE_ERROR,
				"UNKNOWN FS TYPE %d\n",
				req->fs_type
			);
			break;
	}

}

/*
 *  Module initialization
 */
const duk_function_list_entry mn_bi_fs_funcs[] = {
	{"access",            mn_bi_fs_access,              DUK_VARARGS},
	{"accessSync",        mn_bi_fs_access_sync,         DUK_VARARGS},
	{"appendFile",        mn_bi_fs_append_file,         DUK_VARARGS},
	{"appendFileSync",    mn_bi_fs_append_file_sync,    DUK_VARARGS},
	{"chmod",             mn_bi_fs_chmod,               3          },
	{"chmodSync",         mn_bi_fs_chmod_sync,          2          },
	{"chown",             mn_bi_fs_chown,               4          },
	{"chownSync",         mn_bi_fs_chown_sync,          3          },
	{"close",             mn_bi_fs_close,               2          },
	{"closeSync",         mn_bi_fs_close_sync,          1          },
	{"createReadStream",  mn_bi_fs_create_read_stream,  DUK_VARARGS},
	{"createWriteStream", mn_bi_fs_create_write_stream, DUK_VARARGS},
	{"fchmod",            mn_bi_fs_fchmod,              3          },
	{"fchmodSync",        mn_bi_fs_fchmod_sync,         2          },
	{"fchown",            mn_bi_fs_fchown,              4          },
	{"fchownSync",        mn_bi_fs_fchown_sync,         3          },
	{"fdatasync",         mn_bi_fs_fdatasync,           2          },
	{"fdatasyncSync",     mn_bi_fs_fdatasync_sync,      1          },
	{"fstat",             mn_bi_fs_fstat,               2          },
	{"fstatSync",         mn_bi_fs_fstat_sync,          1          },
	{"fsync",             mn_bi_fs_fsync,               2          },
	{"fsyncSync",         mn_bi_fs_fsync_sync,          1          },
	{"ftruncate",         mn_bi_fs_ftruncate,           3          },
	{"ftruncateSync",     mn_bi_fs_ftruncate_sync,      2          },
	{"futimes",           mn_bi_fs_utimes,              4          },
	{"futimesSync",       mn_bi_fs_utimes_sync,         3          },
	{"lchmod",            mn_bi_fs_lchmod,              3          },
	{"lchmodSync",        mn_bi_fs_lchmod_sync,         2          },
	{"lchown",            mn_bi_fs_lchown,              4          },
	{"lchownSync",        mn_bi_fs_lchown_sync,         3          },
	{"link",              mn_bi_fs_link,                3          },
	{"linkSync",          mn_bi_fs_link_sync,           2          },
	{"lstat",             mn_bi_fs_lstat,               2          },
	{"lstatSync",         mn_bi_fs_lstat_sync,          1          },
	{"mkdir",             mn_bi_fs_mkdir,               DUK_VARARGS},
	{"mkdirSync",         mn_bi_fs_mkdir_sync,          DUK_VARARGS},
	{"mkdtemp",           mn_bi_fs_mkdtemp,             2          },
	{"mkdtempSync",       mn_bi_fs_mkdtemp_sync,        1          },
	{"open",              mn_bi_fs_open,                DUK_VARARGS},
	{"openSync",          mn_bi_fs_open_sync,           DUK_VARARGS},
	{"read",              mn_bi_fs_read,                6          },
	{"readdir",           mn_bi_fs_readdir,             DUK_VARARGS},
	{"readdirSync",       mn_bi_fs_readdir_sync,        DUK_VARARGS},
	{"readFile",          mn_bi_fs_read_file,           DUK_VARARGS},
	{"readFileSync",      mn_bi_fs_read_file_sync,      DUK_VARARGS},
	{"readlink",          mn_bi_fs_readlink,            DUK_VARARGS},
	{"readlinkSync",      mn_bi_fs_readlink_sync,       DUK_VARARGS},
	{"readSync",          mn_bi_fs_read_sync,           5          },
	{"realpath",          mn_bi_fs_realpath,            DUK_VARARGS},
	{"realpathSync",      mn_bi_fs_realpath_sync,       DUK_VARARGS},
	{"rename",            mn_bi_fs_rename,              DUK_VARARGS},
	{"renameSync",        mn_bi_fs_rename_sync,         DUK_VARARGS},
	{"rmdir",             mn_bi_fs_rmdir,               2          },
	{"rmdirSync",         mn_bi_fs_rmdir_sync,          1          },
	{"stat",              mn_bi_fs_stat,                2          },
	{"statSync",          mn_bi_fs_stat_sync,           1          },
	{"symlink",           mn_bi_fs_symlink,             DUK_VARARGS},
	{"symlinkSync",       mn_bi_fs_readlink_sync,       DUK_VARARGS},
	{"truncate",          mn_bi_fs_truncate,            3          },
	{"truncateSync",      mn_bi_fs_truncate_sync,       2          },
	{"unlink",            mn_bi_fs_unlink,              2          },
	{"unlinkSync",        mn_bi_fs_unlink_sync,         1          },
	{"unwatchFile",       mn_bi_fs_unwatch_file,        DUK_VARARGS},
	{"utimes",            mn_bi_fs_utimes,              4          },
	{"utimesSync",        mn_bi_fs_utimes_sync,         3          },
	{"watch",             mn_bi_fs_watch,               DUK_VARARGS},
	{"watchFile",         mn_bi_fs_watch_file,          DUK_VARARGS},
	{"write",             mn_bi_fs_write,               DUK_VARARGS},
	{"writeFile",         mn_bi_fs_write_file,          DUK_VARARGS},
	{"writeFileSync",     mn_bi_fs_write_file_sync,     DUK_VARARGS},
	{"writeSync",         mn_bi_fs_write_sync,          DUK_VARARGS},
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_fs_consts[] = {
	{ "F_OK", F_OK },
	{ "R_OK", R_OK },
	{ "W_OK", W_OK },
	{ "X_OK", X_OK },
	{ NULL, 0.0 }
};

duk_ret_t
mn_bi_fs(duk_context *ctx) {
	duk_idx_t fs_idx = duk_push_object(ctx);
	duk_put_function_list(ctx, fs_idx, mn_bi_fs_funcs);
	duk_put_number_list(ctx, fs_idx, mn_bi_fs_consts);
	return 1;
}
