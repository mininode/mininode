HTTP2_SRCS = $(SRCDIR)/src/modules/http2/http2.c

$(foreach file,$(HTTP2_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

