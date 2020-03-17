VM_SRCS = $(SRCDIR)/src/modules/vm/vm.c

$(foreach file,$(VM_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

