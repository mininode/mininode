LIBUV_CFLAGS = $(CORE_CFLAGS) \
							 -fPIC \
							 -Wextra \
							 -Wno-unused-parameter \
							 -I$(SRCDIR)/src/contrib/libuv/include \
							 -I$(SRCDIR)/src/contrib/libuv/src

LIBUV_SRCS += $(SRCDIR)/src/contrib/libuv/src/threadpool.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/async.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/dl.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/fs.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/getaddrinfo.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/getnameinfo.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/loop-watcher.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/loop.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/pipe.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/process.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/signal.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/stream.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/tcp.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/thread.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/timer.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/tty.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/udp.c \
							$(SRCDIR)/src/contrib/libuv/src/version.c \
							$(SRCDIR)/src/contrib/libuv/src/inet.c \
							$(SRCDIR)/src/contrib/libuv/src/fs-poll.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/proctitle.c \
							$(SRCDIR)/src/contrib/libuv/src/uv-common.c

ifeq ($(UNAME_S),Linux)
LIBUV_SRCS += $(SRCDIR)/src/contrib/libuv/src/unix/linux-core.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/linux-inotify.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/linux-syscalls.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/core.c \
							$(SRCDIR)/src/contrib/libuv/src/unix/poll.c
endif

LIBUV_OBJS =
LIBUV_DEPS =

$(foreach file,$(LIBUV_SRCS),$(eval $(call generateRule,$(file),LIBUV_OBJS,LIBUV_DEPS)))

$(OBJDIR)/build/libuv.a: $(LIBUV_OBJS)
	ar crs $@ $^

clean::
	rm -f $(LIBUV_OBJS)
