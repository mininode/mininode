ERRORS_SRCS = $(SRCDIR)/src/modules/errors/errors.c

$(foreach file,$(ERRORS_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

