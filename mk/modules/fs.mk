FS_SRCS = $(SRCDIR)/src/modules/fs/fs.c \
					$(SRCDIR)/src/modules/fs/methods/access.c \
					$(SRCDIR)/src/modules/fs/methods/access_sync.c \
					$(SRCDIR)/src/modules/fs/methods/append_file.c \
					$(SRCDIR)/src/modules/fs/methods/append_file_sync.c \
					$(SRCDIR)/src/modules/fs/methods/chmod.c \
					$(SRCDIR)/src/modules/fs/methods/chmod_sync.c \
					$(SRCDIR)/src/modules/fs/methods/chown.c \
					$(SRCDIR)/src/modules/fs/methods/chown_sync.c \
					$(SRCDIR)/src/modules/fs/methods/close.c \
					$(SRCDIR)/src/modules/fs/methods/close_sync.c \
					$(SRCDIR)/src/modules/fs/methods/create_read_stream.c \
					$(SRCDIR)/src/modules/fs/methods/create_write_stream.c \
					$(SRCDIR)/src/modules/fs/methods/fchmod.c \
					$(SRCDIR)/src/modules/fs/methods/fchmod_sync.c \
					$(SRCDIR)/src/modules/fs/methods/fchown.c \
					$(SRCDIR)/src/modules/fs/methods/fchown_sync.c \
					$(SRCDIR)/src/modules/fs/methods/fdatasync.c \
					$(SRCDIR)/src/modules/fs/methods/fdatasync_sync.c \
					$(SRCDIR)/src/modules/fs/methods/fstat.c \
					$(SRCDIR)/src/modules/fs/methods/fstat_sync.c \
					$(SRCDIR)/src/modules/fs/methods/fsync.c \
					$(SRCDIR)/src/modules/fs/methods/fsync_sync.c \
					$(SRCDIR)/src/modules/fs/methods/ftruncate.c \
					$(SRCDIR)/src/modules/fs/methods/ftruncate_sync.c \
					$(SRCDIR)/src/modules/fs/methods/lchmod.c \
					$(SRCDIR)/src/modules/fs/methods/lchmod_sync.c \
					$(SRCDIR)/src/modules/fs/methods/lchown.c \
					$(SRCDIR)/src/modules/fs/methods/lchown_sync.c \
					$(SRCDIR)/src/modules/fs/methods/link.c \
					$(SRCDIR)/src/modules/fs/methods/link_sync.c \
					$(SRCDIR)/src/modules/fs/methods/lstat.c \
					$(SRCDIR)/src/modules/fs/methods/lstat_sync.c \
					$(SRCDIR)/src/modules/fs/methods/mkdir.c \
					$(SRCDIR)/src/modules/fs/methods/mkdir_sync.c \
					$(SRCDIR)/src/modules/fs/methods/mkdtemp.c \
					$(SRCDIR)/src/modules/fs/methods/mkdtemp_sync.c \
					$(SRCDIR)/src/modules/fs/methods/open.c \
					$(SRCDIR)/src/modules/fs/methods/open_sync.c \
					$(SRCDIR)/src/modules/fs/methods/read.c \
					$(SRCDIR)/src/modules/fs/methods/readdir.c \
					$(SRCDIR)/src/modules/fs/methods/readdir_sync.c \
					$(SRCDIR)/src/modules/fs/methods/readlink.c \
					$(SRCDIR)/src/modules/fs/methods/readlink_sync.c \
					$(SRCDIR)/src/modules/fs/methods/read_sync.c \
					$(SRCDIR)/src/modules/fs/methods/read_file.c \
					$(SRCDIR)/src/modules/fs/methods/read_file_sync.c \
					$(SRCDIR)/src/modules/fs/methods/realpath.c \
					$(SRCDIR)/src/modules/fs/methods/realpath_sync.c \
					$(SRCDIR)/src/modules/fs/methods/rename.c \
					$(SRCDIR)/src/modules/fs/methods/rename_sync.c \
					$(SRCDIR)/src/modules/fs/methods/rmdir.c \
					$(SRCDIR)/src/modules/fs/methods/rmdir_sync.c \
					$(SRCDIR)/src/modules/fs/methods/stat.c \
					$(SRCDIR)/src/modules/fs/methods/stat_sync.c \
					$(SRCDIR)/src/modules/fs/methods/symlink.c \
					$(SRCDIR)/src/modules/fs/methods/symlink_sync.c \
					$(SRCDIR)/src/modules/fs/methods/truncate.c \
					$(SRCDIR)/src/modules/fs/methods/truncate_sync.c \
					$(SRCDIR)/src/modules/fs/methods/unlink.c \
					$(SRCDIR)/src/modules/fs/methods/unlink_sync.c \
					$(SRCDIR)/src/modules/fs/methods/unwatch_file.c \
					$(SRCDIR)/src/modules/fs/methods/utimes.c \
					$(SRCDIR)/src/modules/fs/methods/utimes_sync.c \
					$(SRCDIR)/src/modules/fs/methods/watch.c \
					$(SRCDIR)/src/modules/fs/methods/watch_file.c \
					$(SRCDIR)/src/modules/fs/methods/write.c \
					$(SRCDIR)/src/modules/fs/methods/write_file.c \
					$(SRCDIR)/src/modules/fs/methods/write_file_sync.c \
					$(SRCDIR)/src/modules/fs/methods/write_sync.c

$(foreach file,$(FS_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

