#include "callbacks.h"

void
mn_close_cb(uv_handle_t *handle) {
	duk_context *ctx = handle->loop->data;
	mn_handle_t* data = handle->data;

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
	mn_fulfill_req(ctx, (uv_req_t*)req, 1);
	req->data = mn_cleanup_req(ctx, req->data);
}

void
mn_shutdown_cb(uv_shutdown_t *req, int status) {
	duk_context *ctx = req->handle->loop->data;
	mn_push_status(ctx, status);
	mn_fulfill_req(ctx, (uv_req_t*)req, 1);
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
		char* out;
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
mn_alloc_cb(uv_handle_t *handle, size_t suggested_size, uv_buf_t* buf) {
	buf->base = malloc(suggested_size);
	assert(buf->base);
	buf->len = suggested_size;
}
