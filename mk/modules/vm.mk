VM_SRCS = $(SRCDIR)/src/modules/vm/vm.c

$(foreach file,$(VM_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

