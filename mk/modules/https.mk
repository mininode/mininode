HTTPS_SRCS = $(SRCDIR)/src/modules/https/https.c \
						 $(SRCDIR)/src/modules/https/methods/close.c \
						 $(SRCDIR)/src/modules/https/methods/create_server.c \
						 $(SRCDIR)/src/modules/https/methods/listen.c \
						 $(SRCDIR)/src/modules/https/classes/server/server.c \
						 $(SRCDIR)/src/modules/https/classes/server/methods/set_timeout.c

$(foreach file,$(HTTPS_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

