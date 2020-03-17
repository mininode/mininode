NET_SRCS = $(SRCDIR)/src/modules/net/net.c \
					 $(SRCDIR)/src/modules/net/methods/connect.c \
					 $(SRCDIR)/src/modules/net/methods/create_connection.c \
					 $(SRCDIR)/src/modules/net/methods/create_server.c \
					 $(SRCDIR)/src/modules/net/methods/is_ip.c \
					 $(SRCDIR)/src/modules/net/methods/is_ip_v4.c \
					 $(SRCDIR)/src/modules/net/methods/is_ip_v6.c \
					 $(SRCDIR)/src/modules/net/classes/server/server.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/address.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/close.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/get_connections.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/listen.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/ref.c \
					 $(SRCDIR)/src/modules/net/classes/server/methods/unref.c

$(foreach file,$(NET_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

