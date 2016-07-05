#include "duktape.h"

static duk_ret_t my_print(duk_context *ctx) {
	duk_push_string(ctx, " ");
	duk_insert(ctx, 0);
	duk_join(ctx, duk_get_top(ctx) - 1);
	printf("%s\n", duk_safe_to_string(ctx, -1));
	return 0;
}

/*
 *  Duktape/C functions providing vm module functionality.
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
static const duk_function_list_entry vm_funcs[] = {
	{ "func1", my_func_1, 3 /*nargs*/ },
	{ "func2", my_func_2, DUK_VARARGS /*nargs*/ },
	{ NULL, NULL, 0 }
};

static const duk_number_list_entry vm_consts[] = {
	{ "FLAG_FOO", (double) (1 << 0) },
	{ NULL, 0.0 }
};

static duk_ret_t dukopen_vm(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, vm_funcs);
	duk_put_number_list(ctx, -1, vm_consts);
	return 1;
}

/*
 *  Example of how a modSearch() function can use module.exports to return
 *  the C module initialization value.
 */
static duk_ret_t vm_modsearch(duk_context *ctx) {
	/* Arguments: id, require, exports, module.
	 *
	 * The 'id' is ignored in this example, normally you'd use 'id' to
	 * select which module to initialize.
	 */

	/* Initialize the C module. */
	duk_push_c_function(ctx, dukopen_vm, 0);
	duk_call(ctx, 0);

	/* Result is now on stack top.  Overwrite module.exports to make
	 * that value come out from require().
	 */

	/* [ id require exports module c_module ] */
	duk_put_prop_string(ctx, 3 /*module*/, "exports");  /* module.exports = c_module; */

	return 0;  /* return undefined, no Ecmascript source code */
}

/*
 *  Main
 */

void vm_test(duk_context *ctx) {
	//TEST_SAFE_CALL(test_use_module);
	//TEST_SAFE_CALL(test_modsearch_module);
}
