READLINE_SRCS = $(SRCDIR)/src/modules/readline/readline.c

$(foreach file,$(READLINE_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

