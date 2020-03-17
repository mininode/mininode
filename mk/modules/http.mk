HTTP_SRCS = $(SRCDIR)/src/modules/http/http.c \
						$(SRCDIR)/src/modules/http/methods/create_server.c

$(foreach file,$(HTTP_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

