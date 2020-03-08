LIBUV_CFLAGS += $(CFLAGS)                   \
                -Wall                       \
                -Wextra                     \
                -Wno-unused-parameter       \
								-I$(SRCDIR)/src/contrib/libuv/include \
								-I$(SRCDIR)/src/contrib/libuv/src

LIBUV_HDRS = $(SRCDIR)/src/contrib/libuv/include/tree.h          \
						 $(SRCDIR)/src/contrib/libuv/include/uv-errno.h      \
						 $(SRCDIR)/src/contrib/libuv/include/uv-threadpool.h \
						 $(SRCDIR)/src/contrib/libuv/include/uv-version.h    \
						 $(SRCDIR)/src/contrib/libuv/include/uv.h            \
						 $(SRCDIR)/src/contrib/libuv/src/heap-inl.h          \
						 $(SRCDIR)/src/contrib/libuv/src/queue.h             \
						 $(SRCDIR)/src/contrib/libuv/src/uv-common.h

ifeq ($(OS),Windows_NT)
$(error Windows targets are unsupported.)
else
    LIBUV_SRCS += $(SRCDIR)/src/contrib/libuv/src/threadpool.c        \
                  $(SRCDIR)/src/contrib/libuv/src/unix/async.c        \
									$(SRCDIR)/src/contrib/libuv/src/unix/dl.c           \
									$(SRCDIR)/src/contrib/libuv/src/unix/fs.c           \
									$(SRCDIR)/src/contrib/libuv/src/unix/getaddrinfo.c  \
									$(SRCDIR)/src/contrib/libuv/src/unix/getnameinfo.c  \
									$(SRCDIR)/src/contrib/libuv/src/unix/loop-watcher.c \
									$(SRCDIR)/src/contrib/libuv/src/unix/loop.c         \
									$(SRCDIR)/src/contrib/libuv/src/unix/pipe.c         \
									$(SRCDIR)/src/contrib/libuv/src/unix/process.c      \
									$(SRCDIR)/src/contrib/libuv/src/unix/signal.c       \
									$(SRCDIR)/src/contrib/libuv/src/unix/stream.c       \
									$(SRCDIR)/src/contrib/libuv/src/unix/tcp.c          \
									$(SRCDIR)/src/contrib/libuv/src/unix/thread.c       \
									$(SRCDIR)/src/contrib/libuv/src/unix/timer.c        \
									$(SRCDIR)/src/contrib/libuv/src/unix/tty.c          \
									$(SRCDIR)/src/contrib/libuv/src/unix/udp.c          \
									$(SRCDIR)/src/contrib/libuv/src/version.c           \
									$(SRCDIR)/src/contrib/libuv/src/inet.c              \
									$(SRCDIR)/src/contrib/libuv/src/fs-poll.c           \
									$(SRCDIR)/src/contrib/libuv/src/unix/proctitle.c    \
									$(SRCDIR)/src/contrib/libuv/src/uv-common.c

    ifeq ($(UNAME_S),Linux)
        LIBUV_SRCS += $(SRCDIR)/src/contrib/libuv/src/unix/linux-core.c     \
											$(SRCDIR)/src/contrib/libuv/src/unix/linux-inotify.c  \
											$(SRCDIR)/src/contrib/libuv/src/unix/linux-syscalls.c \
											$(SRCDIR)/src/contrib/libuv/src/unix/core.c           \
											$(SRCDIR)/src/contrib/libuv/src/unix/poll.c
 
        LIBUV_CFLAGS += -fPIC

    else ifeq ($(UNAME_S),Darwin)
				# TBD
    else ifeq ($(UNAME_S),SunOS)
        # TBD
    endif
endif

LIBUV_OBJS = $(subst $(SRCDIR),$(OBJDIR),$(LIBUV_SRCS:.c=.o))

LIBUV_DEPS = $(LIBUV_OBJS:.o=.d)
include $(LIBUV_DEPS)

$(LIBUV_DEPS): $(LIBUV_SRCS) $(LIBUV_HDRS) | $(OBJDIR)
	$(CC) -MM $(LIBUV_CFLAGS) $^ | sed -e 's!^!$(OBJDIR)/!' >$@
  
$(OBJDIR)/src/contrib/libuv/%.o: | $(OBJDIR)
	$(CC) $(LIBUV_CFLAGS) -c -o $@ $(subst $(OBJDIR),$(SRCDIR),$(@:.o=.c))


$(OBJDIR)/build/libuv.a: $(LIBUV_OBJS)
	ar crs $@ $^



