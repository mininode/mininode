TIMERS_SRCS = $(SRCDIR)/src/modules/timers/timers.c \
							 $(SRCDIR)/src/modules/timers/methods/clear_immediate.c \
							 $(SRCDIR)/src/modules/timers/methods/clear_interval.c \
							 $(SRCDIR)/src/modules/timers/methods/clear_timeout.c \
							 $(SRCDIR)/src/modules/timers/methods/set_immediate.c \
							 $(SRCDIR)/src/modules/timers/methods/set_interval.c \
							 $(SRCDIR)/src/modules/timers/methods/set_timeout.c


$(foreach file,$(TIMERS_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

