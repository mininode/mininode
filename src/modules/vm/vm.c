#include <stdio.h>
#include "duktape.h"
#include "mininode.h"

/*
 *  Duktape/C functions providing Node.js 'vm' module functionality.
 *  See https://nodejs.org/dist/v6.9.2/docs/api/vm.html
 */

/* Implementation TBD */

/*
 *  Module initialization
 */

const duk_function_list_entry mn_bi_vm_funcs[] = {
	{ NULL, NULL, 0 }
};

const duk_number_list_entry mn_bi_vm_consts[] = {
	{ NULL, 0.0 }
};

duk_ret_t mn_bi_vm(duk_context *ctx) {
	duk_push_object(ctx);
	duk_put_function_list(ctx, -1, mn_bi_vm_funcs);
	duk_put_number_list(ctx, -1, mn_bi_vm_consts);
	return 1;
}
