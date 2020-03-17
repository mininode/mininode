ASSERT_SRCS = $(SRCDIR)/src/modules/assert/assert.c \
							$(SRCDIR)/src/modules/assert/methods/deep_equal.c \
							$(SRCDIR)/src/modules/assert/methods/deep_strict_equal.c \
							$(SRCDIR)/src/modules/assert/methods/does_not_throw.c \
							$(SRCDIR)/src/modules/assert/methods/equal.c \
							$(SRCDIR)/src/modules/assert/methods/fail.c \
							$(SRCDIR)/src/modules/assert/methods/if_error.c \
							$(SRCDIR)/src/modules/assert/methods/not_deep_equal.c \
							$(SRCDIR)/src/modules/assert/methods/not_equal.c \
							$(SRCDIR)/src/modules/assert/methods/not_strict_deep_equal.c \
							$(SRCDIR)/src/modules/assert/methods/not_strict_equal.c \
							$(SRCDIR)/src/modules/assert/methods/ok.c \
							$(SRCDIR)/src/modules/assert/methods/strict_equal.c \
							$(SRCDIR)/src/modules/assert/methods/throws.c

$(foreach file,$(ASSERT_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

