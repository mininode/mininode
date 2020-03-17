EVENTS_SRCS = $(SRCDIR)/src/modules/events/events.c \
							 $(SRCDIR)/src/modules/events/methods/add_listener.c \
							 $(SRCDIR)/src/modules/events/methods/emit.c \
							 $(SRCDIR)/src/modules/events/methods/event_names.c \
							 $(SRCDIR)/src/modules/events/methods/get_max_listeners.c \
							 $(SRCDIR)/src/modules/events/methods/listener_count.c \
							 $(SRCDIR)/src/modules/events/methods/listeners.c \
							 $(SRCDIR)/src/modules/events/methods/on.c \
							 $(SRCDIR)/src/modules/events/methods/once.c \
							 $(SRCDIR)/src/modules/events/methods/prepend_listener.c \
							 $(SRCDIR)/src/modules/events/methods/prepend_once_listener.c \
							 $(SRCDIR)/src/modules/events/methods/remove_all_listeners.c \
							 $(SRCDIR)/src/modules/events/methods/remove_listener.c \
							 $(SRCDIR)/src/modules/events/classes/event_emitter/event_emitter.c


$(foreach file,$(EVENTS_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

