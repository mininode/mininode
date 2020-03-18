PATH_SRCS = $(SRCDIR)/src/modules/path/path.c \
						$(SRCDIR)/src/modules/path/methods/basename.c \
						$(SRCDIR)/src/modules/path/methods/dirname.c \
						$(SRCDIR)/src/modules/path/methods/extname.c \
						$(SRCDIR)/src/modules/path/methods/format.c \
						$(SRCDIR)/src/modules/path/methods/is_absolute.c \
						$(SRCDIR)/src/modules/path/methods/join.c \
						$(SRCDIR)/src/modules/path/methods/normalize.c \
						$(SRCDIR)/src/modules/path/methods/parse.c \
						$(SRCDIR)/src/modules/path/methods/relative.c \
						$(SRCDIR)/src/modules/path/methods/resolve.c

$(foreach file,$(PATH_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

