LIBTUV_SRCS = $(SRCDIR)/src/contrib/libtuv/src/fs-poll.c      \
							$(SRCDIR)/src/contrib/libtuv/src/inet.c         \
							$(SRCDIR)/src/contrib/libtuv/src/version.c      \
							$(SRCDIR)/src/contrib/libtuv/src/threadpool.c   \
							$(SRCDIR)/src/contrib/libtuv/src/uv-common.c    \
							$(SRCDIR)/src/contrib/libtuv/src/tuv_debuglog.c

ifeq ($(UNAME_S),Linux)
LIBTUV_SRCS += $(SRCDIR)/src/contrib/libtuv/src/unix/async.c          \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/dl.c             \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/fs.c             \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/getaddrinfo.c    \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/getnameinfo.c    \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/loop-watcher.c   \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/loop.c           \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/pipe.c           \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/process.c        \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/signal.c         \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/stream.c         \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/tcp.c            \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/thread.c         \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/timer.c          \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/tty.c            \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/udp.c            \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/proctitle.c      \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/linux.c     \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/core.c           \
							 $(SRCDIR)/src/contrib/libtuv/src/unix/poll.c
endif

LIBTUV_OBJS =
LIBTUV_DEPS =

$(foreach file,$(LIBTUV_SRCS),$(eval $(call generateRule,$(file),LIBTUV_OBJS,LIBTUV_DEPS)))

$(OBJDIR)/build/libtuv.a: $(LIBTUV_OBJS)
	ar crs $@ $^
	ranlib $@

clean::
	rm -f $(LIBTUV_OBJS) $(LIBTUV_DEPS)
