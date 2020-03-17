DNS_SRCS = $(SRCDIR)/src/modules/dns/dns.c

$(foreach file,$(DNS_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

