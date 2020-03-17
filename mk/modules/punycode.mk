PUNYCODE_SRCS = $(SRCDIR)/src/modules/punycode/punycode.c

$(foreach file,$(PUNYCODE_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

