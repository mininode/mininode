V8_SRCS = $(SRCDIR)/src/modules/v8/v8.c

$(foreach file,$(V8_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

