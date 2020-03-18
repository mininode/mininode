PROCESS_SRCS = $(SRCDIR)/src/modules/process/process.c \
							 $(SRCDIR)/src/modules/process/methods/abort.c \
							 $(SRCDIR)/src/modules/process/methods/arch.c \
							 $(SRCDIR)/src/modules/process/methods/argv.c \
							 $(SRCDIR)/src/modules/process/methods/chdir.c \
							 $(SRCDIR)/src/modules/process/methods/connected.c \
							 $(SRCDIR)/src/modules/process/methods/config.c \
							 $(SRCDIR)/src/modules/process/methods/cpu_usage.c \
							 $(SRCDIR)/src/modules/process/methods/cwd.c \
							 $(SRCDIR)/src/modules/process/methods/disconnect.c \
							 $(SRCDIR)/src/modules/process/methods/emit_warning.c \
							 $(SRCDIR)/src/modules/process/methods/env.c \
							 $(SRCDIR)/src/modules/process/methods/exec_argv.c \
							 $(SRCDIR)/src/modules/process/methods/exec_path.c \
							 $(SRCDIR)/src/modules/process/methods/exit.c \
							 $(SRCDIR)/src/modules/process/methods/getegid.c \
							 $(SRCDIR)/src/modules/process/methods/geteuid.c \
							 $(SRCDIR)/src/modules/process/methods/getgid.c \
							 $(SRCDIR)/src/modules/process/methods/getgroups.c \
							 $(SRCDIR)/src/modules/process/methods/getuid.c \
							 $(SRCDIR)/src/modules/process/methods/hrtime.c \
							 $(SRCDIR)/src/modules/process/methods/initgroups.c \
							 $(SRCDIR)/src/modules/process/methods/kill.c \
							 $(SRCDIR)/src/modules/process/methods/main_module.c \
							 $(SRCDIR)/src/modules/process/methods/memory_usage.c \
							 $(SRCDIR)/src/modules/process/methods/next_tick.c \
							 $(SRCDIR)/src/modules/process/methods/pid.c \
							 $(SRCDIR)/src/modules/process/methods/platform.c \
							 $(SRCDIR)/src/modules/process/methods/release.c \
							 $(SRCDIR)/src/modules/process/methods/send.c \
							 $(SRCDIR)/src/modules/process/methods/setegid.c \
							 $(SRCDIR)/src/modules/process/methods/seteuid.c \
							 $(SRCDIR)/src/modules/process/methods/setgid.c \
							 $(SRCDIR)/src/modules/process/methods/setgroups.c \
							 $(SRCDIR)/src/modules/process/methods/setuid.c \
							 $(SRCDIR)/src/modules/process/methods/umask.c \
							 $(SRCDIR)/src/modules/process/methods/uptime.c \
							 $(SRCDIR)/src/modules/process/methods/version.c \

$(foreach file,$(PROCESS_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

