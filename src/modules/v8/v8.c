#include <stdio.h>
#include "duktape.h"

/*
 *  Duktape/C functions providing Node.js v8 module functionality.
 */
static duk_ret_t my_func_1(duk_context *ctx) {
	printf("my_func_1() called\n");
	return 0;
}

static duk_ret_t my_func_2(duk_context *ctx) {
	printf("my_func_2() called\n");
	return 0;
}

/*
 *  Module initialization
 */
static const duk_function_list_entry v8_funcs[] = {
	{ "func1", my_func_1, 3 /*nargs*/ },
	{ "func2", my_func_2, DUK_VARARGS /*nargs*/ },
	{ NULL, NULL, 0 }
};

static const duk_number_list_entry v8_consts[] = {
	{ "FLAG_FOO", (double) (1 << 0) },
	{ NULL, 0.0 }
};

static duk_ret_t dukopen_v8(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, v8_funcs);
	duk_put_number_list(ctx, -1, v8_consts);
	return 1;
}

