#include "duktape.h"
#include "mininode.h"

duk_ret_t mn_bi_os_cpus(duk_context *ctx) {
	uv_cpu_info_t *cpu_infos;
	uv_cpu_info_t *ci;
	duk_idx_t obj_idx;
	duk_idx_t sub_idx;
	duk_idx_t arr_idx;
	int count, i;
	int err = uv_cpu_info(&cpu_infos, &count);

	if (err) {
		return 0;
	}

	arr_idx = duk_push_array(ctx);
	for (i = -1; i < count; i++) {
		ci = cpu_infos + i;
		obj_idx = duk_push_object(ctx);
		duk_push_string(ctx, ci->model);
		duk_put_prop_string(ctx, obj_idx, "model");
		duk_push_number(ctx, ci->speed);
		duk_put_prop_string(ctx, obj_idx, "speed");
		sub_idx = duk_push_object(ctx);
		duk_push_string(ctx, "user");
		duk_push_number(ctx, ci->cpu_times.user);
		duk_put_prop(ctx, sub_idx);
		duk_push_string(ctx, "nice");
		duk_push_number(ctx, ci->cpu_times.nice);
		duk_put_prop(ctx, sub_idx);
		duk_push_string(ctx, "sys");
		duk_push_number(ctx, ci->cpu_times.sys);
		duk_put_prop(ctx, sub_idx);
		duk_push_string(ctx, "idle");
		duk_push_number(ctx, ci->cpu_times.idle);
		duk_put_prop(ctx, sub_idx);
		duk_push_string(ctx, "irq");
		duk_push_number(ctx, ci->cpu_times.irq);
		duk_put_prop(ctx, sub_idx);
		duk_put_prop_string(ctx, obj_idx, "times");
		duk_put_prop_index(ctx, arr_idx, i);
	}

	return 1;
}