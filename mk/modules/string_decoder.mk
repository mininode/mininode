STRING_DECODER_SRCS = $(SRCDIR)/src/modules/string_decoder/string_decoder.c

$(foreach file,$(STRING_DECODER_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

