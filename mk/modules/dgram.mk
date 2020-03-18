DGRAM_SRCS = $(SRCDIR)/src/modules/dgram/dgram.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/socket.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/add_membership.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/address.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/bind.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/close.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/drop_membership.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/ref.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/send.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/set_broadcast.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/set_multicast_loopback.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/set_multicast_ttl.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/set_ttl.c \
						 $(SRCDIR)/src/modules/dgram/classes/socket/methods/unref.c

$(foreach file,$(DGRAM_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

