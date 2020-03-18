CONSOLE_SRCS = $(SRCDIR)/src/modules/console/console.c \
							 $(SRCDIR)/src/modules/console/methods/assert.c \
							 $(SRCDIR)/src/modules/console/methods/dir.c \
							 $(SRCDIR)/src/modules/console/methods/error.c \
							 $(SRCDIR)/src/modules/console/methods/info.c \
							 $(SRCDIR)/src/modules/console/methods/log.c \
							 $(SRCDIR)/src/modules/console/methods/time.c \
							 $(SRCDIR)/src/modules/console/methods/time_end.c \
							 $(SRCDIR)/src/modules/console/methods/trace.c \
							 $(SRCDIR)/src/modules/console/methods/warn.c

$(foreach file,$(CONSOLE_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

