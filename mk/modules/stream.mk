STREAM_SRCS = $(SRCDIR)/src/modules/stream/stream.c

$(foreach file,$(STREAM_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

