#include <stdint.h>
#include <stdbool.h>
#include "duktape.h"
#include "uv.h"

#if !defined(MININODE_H)
#define MININODE_H

/* Semantic versioning */
#define MININODE_VERSION "0.0.1"
/* Timeout values > TIMEOUT_MAX are set to 1. */
#define TIMEOUT_MAX UINT32_MAX
/* The event loop, shared across compilation units. */
extern uv_loop_t *mn_loop;
/*
 * This buildin_loader typedef is a bit ambiguous in isolation, but it is used
 * by the gperf(1) hash for the module loader. It makes the syntax there clean.
 * I've just included it here because I felt it might be useful, but maybe not.
 *
 * See src/include/builtin_hash.gperf.
 */
typedef duk_ret_t (*builtin_loader)(duk_context *ctx);

/* Currently a maximum of 256 callbacks can be registered simultaneously. */
typedef uint8_t mn_cb_id_t;

#define MN_CLOSED 0
#define MN_TIMEOUT 1
#define MN_PREPARE 2
#define MN_IDLE 3
#define MN_CHECK 4
#define MN_ASYNC 5
#define MN_POLL 6
#define MN_SIGNAL 7
#define MN_EXIT 8
#define MN_CONNECTION 9
#define MN_READ 10
#define MN_RECV 11
#define MN_FS_EVENT 12
#define MN_FS_POLL 13
#define MN_RESERVED_1 14
#define MN_RESERVED_2 15

typedef struct {
	uint8_t type; 
	int32_t ref;
	int32_t context;
	mn_cb_id_t callbacks[16]; /* 128 bits */
} mn_handle_t;

typedef struct {
	int req_ref; /* ref for uv_req_t's userdata */
	int context;
	mn_cb_id_t callback_ref; /* ref for callback */
	int data_ref;
	void *data; /* extra data */
} mn_req_t;

mn_req_t *mn_setup_req(duk_context *ctx, int callback_index);
void mn_ref_setup(duk_context *ctx);
int mn_ref(duk_context *ctx);
void mn_push_ref(duk_context *ctx, int ref);
void mn_unref(duk_context *ctx, int ref);

/* Create a global array refs in the heap stash. */
void mn_ref_setup(duk_context *ctx);
/* like luaL_ref, but assumes storage in "refs" property of heap stash */
int mn_ref(duk_context *ctx);
void mn_push_ref(duk_context *ctx, int ref);
void mn_unref(duk_context *ctx, int ref);

uv_loop_t *get_mn_loop(duk_context *ctx);
mn_handle_t *mn_setup_handle(duk_context *ctx);
mn_req_t *mn_setup_req(duk_context *ctx, int callback_index);
void mn_fulfill_req(duk_context *ctx, uv_req_t* req, int nargs);
mn_req_t *mn_cleanup_req(duk_context *ctx, mn_req_t *data);
void mn_get_data(duk_context *ctx, int index, uv_buf_t* buf);
const char *mn_protocol_to_string(int family);
duk_ret_t mn_loadfile(duk_context *ctx);

duk_ret_t duk_module_eval_main(duk_context *ctx, const char *filename);
void duk_module_loader_init(duk_context *ctx);

void mn_repl_loop(duk_context *ctx);

/*** Internal structures ***/

typedef struct mn_event_emitter_class mn_event_emitter_class;
struct mn_event_emitter_class {
  size_t context_size;
  uint32_t desc;
  uint32_t max_listeners;
  void (*init)(const mn_event_emitter_class **ctx);
  void (*emit)(const mn_event_emitter_class *const *ctx);
};

typedef struct mn_event_emitter_ctx mn_event_emitter_ctx;
struct mn_event_emitter_ctx {
  const mn_event_emitter_class *vtable;
  unsigned char buffer[256];
  uint32_t listeners[256];
  uint64_t count;
};

typedef union {
  const mn_event_emitter_class *vtable;
  mn_event_emitter_ctx emitter;
} mn_event_emitter_compat_ctx;

/*** BUILT-IN MODULES ***/

duk_ret_t mn_bi_assert(duk_context *ctx);
duk_ret_t mn_bi_buffer(duk_context *ctx);
duk_ret_t mn_bi_child_process(duk_context *ctx);
duk_ret_t mn_bi_cluster(duk_context *ctx);

duk_ret_t mn_bi_console(duk_context *ctx); 
duk_ret_t mn_bi_console_log(duk_context *ctx);

duk_ret_t mn_bi_crypto(duk_context *ctx);
duk_ret_t mn_bi_debugger(duk_context *ctx);
duk_ret_t mn_bi_dgram(duk_context *ctx);
duk_ret_t mn_bi_dns(duk_context *ctx);
duk_ret_t mn_bi_errors(duk_context *ctx);
duk_ret_t mn_bi_events(duk_context *ctx);

duk_ret_t mn_bi_fs(duk_context *ctx);
void mn_push_error_result(duk_context *ctx, uv_fs_t* req);
void mn_push_fs_result(duk_context *ctx, uv_fs_t *req);
void mn_push_stats_table(duk_context *ctx, const uv_stat_t *s);
void mn_fs_cb(uv_fs_t *req);
duk_ret_t mn_bi_fs_access(duk_context *ctx);
duk_ret_t mn_bi_fs_access_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_append_file(duk_context *ctx);
duk_ret_t mn_bi_fs_append_file_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_chmod(duk_context *ctx);
duk_ret_t mn_bi_fs_chmod_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_chown(duk_context *ctx);
duk_ret_t mn_bi_fs_chown_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_close(duk_context *ctx);
duk_ret_t mn_bi_fs_close_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_create_read_stream(duk_context *ctx);
duk_ret_t mn_bi_fs_create_write_stream(duk_context *ctx);
duk_ret_t mn_bi_fs_exists(duk_context *ctx);
duk_ret_t mn_bi_fs_exists_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_fchmod(duk_context *ctx);
duk_ret_t mn_bi_fs_fchmod_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_fchown(duk_context *ctx);
duk_ret_t mn_bi_fs_fchown_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_fdatasync(duk_context *ctx);
duk_ret_t mn_bi_fs_fdatasync_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_fstat(duk_context *ctx);
duk_ret_t mn_bi_fs_fstat_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_fsync(duk_context *ctx);
duk_ret_t mn_bi_fs_fsync_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_ftruncate(duk_context *ctx);
duk_ret_t mn_bi_fs_ftruncate_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_lchmod(duk_context *ctx);
duk_ret_t mn_bi_fs_lchmod_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_lchown(duk_context *ctx);
duk_ret_t mn_bi_fs_lchown_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_link(duk_context *ctx);
duk_ret_t mn_bi_fs_link_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_lstat(duk_context *ctx);
duk_ret_t mn_bi_fs_lstat_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_mkdir(duk_context *ctx);
duk_ret_t mn_bi_fs_mkdir_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_mkdtemp(duk_context *ctx);
duk_ret_t mn_bi_fs_mkdtemp_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_open(duk_context *ctx);
duk_ret_t mn_bi_fs_open_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_read(duk_context *ctx);
duk_ret_t mn_bi_fs_read_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_read_file(duk_context *ctx);
duk_ret_t mn_bi_fs_read_file_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_readdir(duk_context *ctx);
duk_ret_t mn_bi_fs_readdir_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_readlink(duk_context *ctx);
duk_ret_t mn_bi_fs_readlink_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_realpath(duk_context *ctx);
duk_ret_t mn_bi_fs_realpath_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_rename(duk_context *ctx);
duk_ret_t mn_bi_fs_rename_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_rmdir(duk_context *ctx);
duk_ret_t mn_bi_fs_rmdir_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_stat(duk_context *ctx);
duk_ret_t mn_bi_fs_stat_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_symlink(duk_context *ctx);
duk_ret_t mn_bi_fs_symlink_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_truncate(duk_context *ctx);
duk_ret_t mn_bi_fs_truncate_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_unlink(duk_context *ctx);
duk_ret_t mn_bi_fs_unlink_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_utimes(duk_context *ctx);
duk_ret_t mn_bi_fs_utimes_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_watch(duk_context *ctx);
duk_ret_t mn_bi_fs_watch_file(duk_context *ctx);
duk_ret_t mn_bi_fs_unwatch_file(duk_context *ctx);
duk_ret_t mn_bi_fs_write(duk_context *ctx);
duk_ret_t mn_bi_fs_write_sync(duk_context *ctx);
duk_ret_t mn_bi_fs_write_file(duk_context *ctx);
duk_ret_t mn_bi_fs_write_file_sync(duk_context *ctx);

duk_ret_t mn_bi_http(duk_context *ctx);
duk_ret_t mn_bi_http_create_client(duk_context *ctx);
duk_ret_t mn_bi_http_create_server(duk_context *ctx);
duk_ret_t mn_bi_http_get(duk_context *ctx);
duk_ret_t mn_bi_http_request(duk_context *ctx);

duk_ret_t mn_bi_http2(duk_context *ctx);

duk_ret_t mn_bi_https(duk_context *ctx);

duk_ret_t mn_bi_net(duk_context *ctx);

duk_ret_t mn_bi_os(duk_context *ctx);
duk_ret_t mn_bi_os_arch(duk_context *ctx);
duk_ret_t mn_bi_os_cpus(duk_context *ctx);
duk_ret_t mn_bi_os_endianness(duk_context *ctx);
duk_ret_t mn_bi_os_freemem(duk_context *ctx);
duk_ret_t mn_bi_os_homedir(duk_context *ctx);
duk_ret_t mn_bi_os_hostname(duk_context *ctx);
duk_ret_t mn_bi_os_loadavg(duk_context *ctx);
duk_ret_t mn_bi_os_network_interfaces(duk_context *ctx);
duk_ret_t mn_bi_os_platform(duk_context *ctx);
duk_ret_t mn_bi_os_release(duk_context *ctx);
duk_ret_t mn_bi_os_tmpdir(duk_context *ctx);
duk_ret_t mn_bi_os_totalmem(duk_context *ctx);
duk_ret_t mn_bi_os_type(duk_context *ctx);
duk_ret_t mn_bi_os_uptime(duk_context *ctx);
duk_ret_t mn_bi_os_user_info(duk_context *ctx);

duk_ret_t mn_bi_path(duk_context *ctx);

duk_ret_t mn_bi_process(duk_context *ctx);
duk_ret_t mn_bi_process_abort(duk_context *ctx);
duk_ret_t mn_bi_process_arch(duk_context *ctx);
duk_ret_t mn_bi_process_argv(duk_context *ctx);
duk_ret_t mn_bi_process_chdir(duk_context *ctx);
duk_ret_t mn_bi_process_config(duk_context *ctx);
duk_ret_t mn_bi_process_connected(duk_context *ctx);
duk_ret_t mn_bi_process_cpu_usage(duk_context *ctx);
duk_ret_t mn_bi_process_cwd(duk_context *ctx);
duk_ret_t mn_bi_process_disconnect(duk_context *ctx);
duk_ret_t mn_bi_process_emit_warning(duk_context *ctx);
duk_ret_t mn_bi_process_env(duk_context *ctx);
duk_ret_t mn_bi_process_exec_argv(duk_context *ctx);
duk_ret_t mn_bi_process_exec_path(duk_context *ctx);
duk_ret_t mn_bi_process_exit(duk_context *ctx);
duk_ret_t mn_bi_process_getegid(duk_context *ctx);
duk_ret_t mn_bi_process_geteuid(duk_context *ctx);
duk_ret_t mn_bi_process_getgid(duk_context *ctx);
duk_ret_t mn_bi_process_getgroups(duk_context *ctx);
duk_ret_t mn_bi_process_getuid(duk_context *ctx);
duk_ret_t mn_bi_process_hrtime(duk_context *ctx);
duk_ret_t mn_bi_process_initgroups(duk_context *ctx);
duk_ret_t mn_bi_process_kill(duk_context *ctx);
duk_ret_t mn_bi_process_main_module(duk_context *ctx);
duk_ret_t mn_bi_process_memory_usage(duk_context *ctx);
duk_ret_t mn_bi_process_next_tick(duk_context *ctx);
duk_ret_t mn_bi_process_pid(duk_context *ctx);
duk_ret_t mn_bi_process_platform(duk_context *ctx);
duk_ret_t mn_bi_process_release(duk_context *ctx);
duk_ret_t mn_bi_process_send(duk_context *ctx);
duk_ret_t mn_bi_process_setegid(duk_context *ctx);
duk_ret_t mn_bi_process_seteuid(duk_context *ctx);
duk_ret_t mn_bi_process_setgid(duk_context *ctx);
duk_ret_t mn_bi_process_setgroups(duk_context *ctx);
duk_ret_t mn_bi_process_setuid(duk_context *ctx);
duk_ret_t mn_bi_process_umask(duk_context *ctx);
duk_ret_t mn_bi_process_uptime(duk_context *ctx);
duk_ret_t mn_bi_process_version(duk_context *ctx);

duk_ret_t mn_bi_punycode(duk_context *ctx);
duk_ret_t mn_bi_querystring(duk_context *ctx);
duk_ret_t mn_bi_readline(duk_context *ctx);
duk_ret_t mn_bi_repl(duk_context *ctx);
duk_ret_t mn_bi_stream(duk_context *ctx);
duk_ret_t mn_bi_string_decoder(duk_context *ctx);

duk_ret_t mn_bi_timers(duk_context *ctx);
duk_ret_t mn_bi_timers_set_immediate(duk_context *ctx);
duk_ret_t mn_bi_timers_set_interval(duk_context *ctx);
duk_ret_t mn_bi_timers_set_timeout(duk_context *ctx);
duk_ret_t mn_bi_timers_clear_immediate(duk_context *ctx);
duk_ret_t mn_bi_timers_clear_interval(duk_context *ctx);
duk_ret_t mn_bi_timers_clear_timeout(duk_context *ctx);

duk_ret_t mn_bi_tls(duk_context *ctx);
duk_ret_t mn_bi_tty(duk_context *ctx);
duk_ret_t mn_bi_url(duk_context *ctx);

duk_ret_t mn_bi_util(duk_context *ctx);
duk_ret_t mn_bi_util_debuglog(duk_context *ctx);
duk_ret_t mn_bi_util_deprecate(duk_context *ctx);
duk_ret_t mn_bi_util_format(duk_context *ctx);
duk_ret_t mn_bi_util_inherits(duk_context *ctx);
duk_ret_t mn_bi_util_inspect(duk_context *ctx);

duk_ret_t mn_bi_v8(duk_context *ctx);
duk_ret_t mn_bi_vm(duk_context *ctx);
duk_ret_t mn_bi_zlib(duk_context *ctx);

#endif
