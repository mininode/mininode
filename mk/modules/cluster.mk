CLUSTER_SRCS = $(SRCDIR)/src/modules/cluster/cluster.c \
							 $(SRCDIR)/src/modules/cluster/classes/worker/worker.c \
							 $(SRCDIR)/src/modules/cluster/classes/worker/methods/is_connected.c \
							 $(SRCDIR)/src/modules/cluster/classes/worker/methods/is_dead.c \
							 $(SRCDIR)/src/modules/cluster/classes/worker/methods/kill.c \
							 $(SRCDIR)/src/modules/cluster/classes/worker/methods/send.c

$(foreach file,$(CLUSTER_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

