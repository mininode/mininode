TTY_SRCS = $(SRCDIR)/src/modules/tty/tty.c

$(foreach file,$(TTY_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

