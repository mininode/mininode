UTIL_SRCS = $(SRCDIR)/src/modules/util/util.c \
						$(SRCDIR)/src/modules/util/methods/debuglog.c \
						$(SRCDIR)/src/modules/util/methods/deprecate.c \
						$(SRCDIR)/src/modules/util/methods/format.c \
						$(SRCDIR)/src/modules/util/methods/inherits.c \
						$(SRCDIR)/src/modules/util/methods/inspect.c

$(foreach file,$(UTIL_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

