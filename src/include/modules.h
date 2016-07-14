/*
 * This buildin_loader typedef is a bit ambiguous in isolation, but it is used
 * by the gperf(1) hash for the module loader. It makes the syntax there clean.
 * I've just included it here because I felt it might be useful, but maybe not.
 *
 * See src/include/builtin_hash.gperf.
 */
typedef duk_ret_t (*builtin_loader)(duk_context *ctx);

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
duk_ret_t mn_bi_https(duk_context *ctx);
duk_ret_t mn_bi_net(duk_context *ctx);
duk_ret_t mn_bi_os(duk_context *ctx);
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