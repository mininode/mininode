QUERYSTRING_SRCS = $(SRCDIR)/src/modules/querystring/querystring.c \
									 $(SRCDIR)/src/modules/querystring/methods/escape.c \
									 $(SRCDIR)/src/modules/querystring/methods/parse.c \
									 $(SRCDIR)/src/modules/querystring/methods/stringify.c \
									 $(SRCDIR)/src/modules/querystring/methods/unescape.c \

$(foreach file,$(QUERYSTRING_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

