REPL_SRCS = $(SRCDIR)/src/modules/repl/repl.c

$(foreach file,$(REPL_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

