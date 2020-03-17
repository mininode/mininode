#include "mininode.h"

void
mn_emit_event(
	duk_context *ctx,
	mn_handle_t *data,
	mn_cb_id_t type,
	int nargs
) {
	int fn_ref = data->callbacks[type];
	if (fn_ref) {
		mn_push_ref(ctx, fn_ref);
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

int
mn_push_status(duk_context *ctx, int status) {
	if (status < 0) {
		return duk_push_error_object(
			ctx,
			DUK_ERR_ERROR,
			"%s: %s",
			uv_err_name(status),
			uv_strerror(status)
		);
	}
	duk_push_null(ctx);
	return 0;
}

void
mn_error(duk_context *ctx, int status) {
	duk_error(
		ctx,
		DUK_ERR_ERROR,
		"%s: %s",
		uv_err_name(status),
		uv_strerror(status)
	);
}

void
mn_check(duk_context *ctx, int status) {
	if (status < 0) mn_error(ctx, status);
}

void
mn_close_cb(uv_handle_t *handle) {
	duk_context *ctx = handle->loop->data;
	mn_handle_t *data = handle->data;

	mn_emit_event(ctx, data, MN_CLOSED, 0);
	handle->data = mn_cleanup_handle(ctx, data);
}

void
mn_timer_cb(uv_timer_t *handle) {
	mn_emit_event(handle->loop->data, handle->data, MN_TIMEOUT, 0);
}

void
mn_connect_cb(uv_connect_t *req, int status) {
	duk_context *ctx = req->handle->loop->data;
	mn_push_status(ctx, status);
	mn_fulfill_req(ctx, (uv_req_t *)req, 1);
	req->data = mn_cleanup_req(ctx, req->data);
}

void
mn_shutdown_cb(uv_shutdown_t *req, int status) {
	duk_context *ctx = req->handle->loop->data;
	mn_push_status(ctx, status);
	mn_fulfill_req(ctx, (uv_req_t *)req, 1);
	req->data = mn_cleanup_req(ctx, req->data);
}

void
mn_connection_cb(uv_stream_t *handle, int status) {
	duk_context *ctx = handle->loop->data;
	mn_push_status(ctx, status);
	mn_emit_event(ctx, handle->data, MN_CONNECTION, 1);
}

void
mn_read_cb(uv_stream_t *handle, ssize_t nread, const uv_buf_t *buf) {
	duk_context *ctx = handle->loop->data;

	if (nread >= 0) {
		char *out;
		duk_push_null(ctx);
		out = duk_push_fixed_buffer(ctx, nread);
		memcpy(out, buf->base, nread);
	}

	free(buf->base);

	if (nread == 0) return;

	if (nread == UV_EOF) {
		duk_push_null(ctx); /* no error */
		duk_push_undefined(ctx); // undefined value to signify EOF
	} else if (nread < 0) {
		mn_push_status(ctx, nread);
	}

	mn_emit_event(ctx, handle->data, MN_READ, 2);
}

void
mn_write_cb(uv_write_t *req, int status) {
	duk_context *ctx = req->handle->loop->data;
	mn_push_status(ctx, status);
	mn_fulfill_req(ctx, (uv_req_t*)req, 1);
	mn_cleanup_req(ctx, req->data);
}

void
mn_alloc_cb(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf) {
	buf->base = malloc(suggested_size);
	assert(buf->base);
	buf->len = suggested_size;
}
