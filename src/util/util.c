#include "mininode.h"

uv_loop_t *
get_mn_loop(duk_context *ctx) {
	duk_memory_functions funcs;
	duk_get_memory_functions(ctx, &funcs);
	return funcs.udata;
}

mn_handle_t *
mn_setup_handle(duk_context *ctx) {
	mn_handle_t *data = duk_alloc(ctx, sizeof(*data));
	duk_push_this(ctx);
	data->context = mn_ref(ctx);
	duk_dup(ctx, -1);
	data->ref = mn_ref(ctx);
	data->callbacks[0] = 0;
	data->callbacks[1] = 0;
	return data;
}

/*
 * Fulfill a libuv request.
 */
void
mn_fulfill_req(duk_context *ctx, uv_req_t *req, int nargs) {
	mn_req_t *data = req->data;
	if (data->callback_ref) {
		mn_push_ref(ctx, data->callback_ref);
		if (nargs) {
			duk_insert(ctx, -1 - nargs);
		}
		mn_push_ref(ctx, data->context);
		if (nargs) {
			duk_insert(ctx, -1 - nargs);
		}
		duk_call_method(ctx, nargs);
		duk_pop(ctx);
	} else if (nargs) {
		duk_pop_n(ctx, nargs);
	}
}

/*
 * Setup a libuv request.
 */
mn_req_t *
mn_setup_req(duk_context *ctx, int callback_index) {
	mn_req_t *data = duk_alloc(ctx, sizeof(*data));
	duk_push_this(ctx);
	data->context = mn_ref(ctx);
	duk_dup(ctx, -1);
	data->req_ref = mn_ref(ctx);

	if (duk_is_function(ctx, callback_index)) {
		duk_dup(ctx, callback_index);
		data->callback_ref = mn_ref(ctx);
	} else {
		data->callback_ref = 0;
	}

	data->data_ref = 0;
	data->data = NULL;
	return data;
}

void
mn_get_data(duk_context *ctx, int index, uv_buf_t* buf) {
	duk_size_t len;

	if (duk_is_string(ctx, index)) {
		buf->base = (char*) duk_get_lstring(ctx, index, &len);
	} else {
		buf->base = duk_get_buffer(ctx, index, &len);
	}

	buf->len = len;
}

/*
 * Cleanup a libuv request.
 */
mn_req_t *
mn_cleanup_req(duk_context *ctx, mn_req_t *data) {
	mn_unref(ctx, data->req_ref);
	mn_unref(ctx, data->context);
	mn_unref(ctx, data->callback_ref);
	mn_unref(ctx, data->data_ref);
	duk_free(ctx, data->data);
	duk_free(ctx, data);
	return NULL;
}

const char *
mn_protocol_to_string(int family) {
#ifdef AF_UNIX
	if (family == AF_UNIX) return "UNIX";
#endif
#ifdef AF_INET
	if (family == AF_INET) return "INET";
#endif
#ifdef AF_INET6
	if (family == AF_INET6) return "INET6";
#endif
#ifdef AF_IPX
	if (family == AF_IPX) return "IPX";
#endif
#ifdef AF_NETLINK
	if (family == AF_NETLINK) return "NETLINK";
#endif
#ifdef AF_X25
	if (family == AF_X25) return "X25";
#endif
#ifdef AF_AX25
	if (family == AF_AX25) return "AX25";
#endif
#ifdef AF_ATMPVC
	if (family == AF_ATMPVC) return "ATMPVC";
#endif
#ifdef AF_APPLETALK
	if (family == AF_APPLETALK) return "APPLETALK";
#endif
#ifdef AF_PACKET
	if (family == AF_PACKET) return "PACKET";
#endif
	return NULL;
}

/*
 * Synchronous readfile using libuv APIs.
 * TODO: Use for module loading.
 */
duk_ret_t
mn_loadfile(duk_context *ctx) {
	const char *path = duk_require_string(ctx, 0);
	uv_fs_t req;
	int fd = 0;
	size_t size;
	char *chunk;
	uv_buf_t buf;

	if (uv_fs_open(mn_loop, &req, path, O_RDONLY, 0644, NULL) < 0) {
		goto sadplace;
	}

	uv_fs_req_cleanup(&req);
	fd = req.result;

	if (uv_fs_fstat(mn_loop, &req, fd, NULL) < 0) {
		goto sadplace;
	}

	uv_fs_req_cleanup(&req);
	size = req.statbuf.st_size;
	chunk = duk_alloc(ctx, size);
	buf = uv_buf_init(chunk, size);

	if (uv_fs_read(mn_loop, &req, fd, &buf, 1, 0, NULL) < 0) {
		duk_free(ctx, chunk);
		goto sadplace;
	}

	uv_fs_req_cleanup(&req);
	duk_push_lstring(ctx, chunk, size);
	duk_free(ctx, chunk);
	uv_fs_close(mn_loop, &req, fd, NULL);
	uv_fs_req_cleanup(&req);

	return 1;

	sadplace:
		uv_fs_req_cleanup(&req);
		if (fd) {
			uv_fs_close(mn_loop, &req, fd, NULL);
		}
		uv_fs_req_cleanup(&req);

		duk_error(
			ctx,
			DUK_ERR_ERROR,
			"%s: %s: %s",
			uv_err_name(req.result),
			uv_strerror(req.result),
			path
		);
}
