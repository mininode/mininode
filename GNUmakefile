# Copyright (c) 2013, Ben Noordhuis <info@bnoordhuis.nl>
# Copyright (c) 2016, Alex Caudill
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

CC ?= gcc

LIBUV_CFLAGS += -Wall \
          -Wextra \
          -Wno-unused-parameter \
	  -Isrc/contrib/libuv/include \
	  -Isrc/contrib/libuv/src

LIBUV_INCLUDES = src/contrib/libuv/include/tree.h \
                 src/contrib/libuv/include/uv-errno.h \
                 src/contrib/libuv/include/uv-threadpool.h \
                 src/contrib/libuv/include/uv-version.h \
                 src/contrib/libuv/include/uv.h \
                 src/contrib/libuv/src/heap-inl.h \
                 src/contrib/libuv/src/queue.h \
                 src/contrib/libuv/src/uv-common.h \
                 src/contrib/libuv/include/uv-win.h \
		 src/contrib/libuv/include/stdint-msvc2008.h \
                 src/contrib/libuv/src/win/atomicops-inl.h \
                 src/contrib/libuv/src/win/handle-inl.h \
                 src/contrib/libuv/src/win/internal.h \
                 src/contrib/libuv/src/win/req-inl.h \
                 src/contrib/libuv/src/win/stream-inl.h \
                 src/contrib/libuv/src/win/winapi.h \
                 src/contrib/libuv/src/win/winsock.h

LIBUV_OBJS = src/contrib/libuv/src/fs-poll.o \
       src/contrib/libuv/src/inet.o \
       src/contrib/libuv/src/threadpool.o \
       src/contrib/libuv/src/uv-common.o \
       src/contrib/libuv/src/version.o 

HTTP_PARSER_OBJS = src/contrib/http-parser/http_parser.o

ifeq ($(OS),Windows_NT)
CCFLAGS += -D WIN32
LIBUV_CFLAGS += -Isrc/win \
                -DWIN32_LEAN_AND_MEAN \
                -D_WIN32_WINNT=0x0600

LIBUV_OBJS += src/contrib/libuv/src/win/async.o \
              src/contrib/libuv/src/win/core.o \
                  src/contrib/libuv/src/win/dl.o \
                  src/contrib/libuv/src/win/error.o \
                  src/contrib/libuv/src/win/fs-event.o \
                  src/contrib/libuv/src/win/fs.o \
                  src/contrib/libuv/src/win/getaddrinfo.o \
                  src/contrib/libuv/src/win/getnameinfo.o \
                  src/contrib/libuv/src/win/handle.o \
                  src/contrib/libuv/src/win/loop-watcher.o \
                  src/contrib/libuv/src/win/pipe.o \
                  src/contrib/libuv/src/win/poll.o \
                  src/contrib/libuv/src/win/process-stdio.o \
                  src/contrib/libuv/src/win/process.o \
                  src/contrib/libuv/src/win/req.o \
                  src/contrib/libuv/src/win/signal.o \
                  src/contrib/libuv/src/win/stream.o \
                  src/contrib/libuv/src/win/tcp.o \
                  src/contrib/libuv/src/win/thread.o \
                  src/contrib/libuv/src/win/timer.o \
                  src/contrib/libuv/src/win/tty.o \
                  src/contrib/libuv/src/win/udp.o \
                  src/contrib/libuv/src/win/util.o \
                  src/contrib/libuv/src/win/winapi.o \
                  src/contrib/libuv/src/win/winsock.o

else
    LIBUV_OBJS += src/contrib/libuv/src/unix/core.o \
                  src/contrib/libuv/src/unix/async.o \
		  src/contrib/libuv/src/unix/dl.o \
		  src/contrib/libuv/src/unix/fs.o \
		  src/contrib/libuv/src/unix/getaddrinfo.o \
		  src/contrib/libuv/src/unix/getnameinfo.o \
		  src/contrib/libuv/src/unix/loop-watcher.o \
		  src/contrib/libuv/src/unix/loop.o \
		  src/contrib/libuv/src/unix/pipe.o \
		  src/contrib/libuv/src/unix/poll.o \
		  src/contrib/libuv/src/unix/process.o \
		  src/contrib/libuv/src/unix/proctitle.o \
		  src/contrib/libuv/src/unix/pthread-barrier.o \
		  src/contrib/libuv/src/unix/pthread-fixes.o \
		  src/contrib/libuv/src/unix/signal.o \
		  src/contrib/libuv/src/unix/stream.o \
		  src/contrib/libuv/src/unix/tcp.o \
		  src/contrib/libuv/src/unix/thread.o \
		  src/contrib/libuv/src/unix/timer.o \
		  src/contrib/libuv/src/unix/tty.o \
		  src/contrib/libuv/src/unix/udp.o

    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        #TBD
    endif
    ifeq ($(UNAME_S),Darwin)
        # TBD
    endif
    ifeq ($(UNAME_S),SunOS)
        # TBD
    endif
endif

all: libuv.a libhttparser.a

clean:
	-$(RM) $(LIBUV_OBJS) libuv.a
	-$(RM) $(HTTP_PARSER_OBJS) libhttparser.a

libuv.a: $(LIBUV_OBJS)
	$(AR) crs $@ $^

libhttparser.a: $(HTTP_PARSER_OBJS)
	$(AR) crs $@ $^

$(LIBUV_OBJS): %.o : %.c $(LIBUV_INCLUDES)
	$(CC) $(LIBUV_CFLAGS)  -c -o $@ $<
