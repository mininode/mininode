TLS_SRCS = $(SRCDIR)/src/modules/tls/tls.c \
					 $(SRCDIR)/src/modules/tls/methods/connect.c \
					 $(SRCDIR)/src/modules/tls/methods/create_secure_context.c \
					 $(SRCDIR)/src/modules/tls/methods/create_server.c \
					 $(SRCDIR)/src/modules/tls/methods/get_ciphers.c \
					 $(SRCDIR)/src/modules/tls/classes/server/server.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/add_context.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/address.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/close.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/get_ticket_keys.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/listen.c \
					 $(SRCDIR)/src/modules/tls/classes/server/methods/set_ticket_keys.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/address.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_cipher.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_ephemeral_key_info.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_peer_certificate.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_protocol.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_session.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/get_tls_ticket.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/renegotiate.c \
					 $(SRCDIR)/src/modules/tls/classes/tls_socket/methods/set_max_send_fragment.c

$(foreach file,$(TLS_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

