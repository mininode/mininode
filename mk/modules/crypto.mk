CRYPTO_SRCS = $(SRCDIR)/src/modules/crypto/crypto.c

$(foreach file,$(CRYPTO_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

