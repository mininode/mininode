BUFFER_SRCS = $(SRCDIR)/src/modules/buffer/buffer.c


$(foreach file,$(BUFFER_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

