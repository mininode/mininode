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
duk_ret_t mn_bi_http(duk_context *ctx);
duk_ret_t mn_bi_https(duk_context *ctx);
duk_ret_t mn_bi_net(duk_context *ctx);
duk_ret_t mn_bi_os(duk_context *ctx);
duk_ret_t mn_bi_path(duk_context *ctx);
duk_ret_t mn_bi_process(duk_context *ctx);
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