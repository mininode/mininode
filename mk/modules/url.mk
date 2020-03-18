URL_SRCS = $(SRCDIR)/src/modules/url/url.c

$(foreach file,$(URL_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

