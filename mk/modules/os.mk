OS_SRCS = $(SRCDIR)/src/modules/os/os.c \
					$(SRCDIR)/src/modules/os/methods/arch.c \
					$(SRCDIR)/src/modules/os/methods/cpus.c \
					$(SRCDIR)/src/modules/os/methods/endianness.c \
					$(SRCDIR)/src/modules/os/methods/freemem.c \
					$(SRCDIR)/src/modules/os/methods/homedir.c \
					$(SRCDIR)/src/modules/os/methods/hostname.c \
					$(SRCDIR)/src/modules/os/methods/loadavg.c \
					$(SRCDIR)/src/modules/os/methods/network_interfaces.c \
					$(SRCDIR)/src/modules/os/methods/platform.c \
					$(SRCDIR)/src/modules/os/methods/release.c \
					$(SRCDIR)/src/modules/os/methods/tmpdir.c \
					$(SRCDIR)/src/modules/os/methods/totalmem.c \
					$(SRCDIR)/src/modules/os/methods/type.c \
					$(SRCDIR)/src/modules/os/methods/uptime.c \
					$(SRCDIR)/src/modules/os/methods/user_info.c

$(foreach file,$(OS_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

