DEBUGGER_SRCS = $(SRCDIR)/src/modules/debugger/debugger.c

$(foreach file,$(DEBUGGER_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

