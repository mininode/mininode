CHILD_PROCESS_SRCS = $(SRCDIR)/src/modules/child_process/child_process.c \
										 $(SRCDIR)/src/modules/child_process/methods/disconnect.c \
										 $(SRCDIR)/src/modules/child_process/methods/exec.c \
										 $(SRCDIR)/src/modules/child_process/methods/exec_file_sync.c \
										 $(SRCDIR)/src/modules/child_process/methods/exec_sync.c \
										 $(SRCDIR)/src/modules/child_process/methods/fork.c \
										 $(SRCDIR)/src/modules/child_process/methods/kill.c \
										 $(SRCDIR)/src/modules/child_process/methods/send.c \
										 $(SRCDIR)/src/modules/child_process/methods/spawn.c \
										 $(SRCDIR)/src/modules/child_process/methods/spawn_sync.c

$(foreach file,$(CHILD_PROCESS_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

