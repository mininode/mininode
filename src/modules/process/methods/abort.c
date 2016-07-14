#include "duktape.h"

duk_ret_t mn_bi_process_abort(duk_context *ctx) {
	abort();
}
