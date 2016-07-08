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
CFLAGS ?= -Os -std=c99

LIBUV_CFLAGS += $(CFLAGS) \
                -Wall \
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
                 src/contrib/libuv/src/uv-common.h

LIBUV_OBJS = src/contrib/libuv/src/fs-poll.o \
             src/contrib/libuv/src/inet.o \
             src/contrib/libuv/src/threadpool.o \
             src/contrib/libuv/src/uv-common.o \
             src/contrib/libuv/src/version.o 

HTTP_PARSER_CFLAGS = $(CFLAGS)

HTTP_PARSER_OBJS = src/contrib/http-parser/http_parser.o

ifeq ($(OS),Windows_NT)
$(error Windows is currently unsupported.)
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
        # TBD
    endif
    ifeq ($(UNAME_S),Darwin)
        # TBD
    endif
    ifeq ($(UNAME_S),SunOS)
        # TBD
    endif
endif

MININODE_CFLAGS = $(CFLAGS) \
                  -Wall \
                  -Isrc/contrib/duktape \
		  -Isrc/contrib \
		  -Isrc/contrib/libz \
		  -Isrc/modules \
		  -D_XOPEN_SOURCE=600 \
		  -DMINIZ_NO_TIME

MININODE_OBJS = src/contrib/duktape/duktape.o \
                src/modules/assert/assert.o \
		src/modules/buffer/buffer.o \
		src/modules/child_process/child_process.o \
		src/modules/cluster/cluster.o \
		src/modules/console/console.o \
		src/modules/crypto/crypto.o \
		src/modules/debugger/debugger.o \
		src/modules/dgram/dgram.o \
		src/modules/dns/dns.o \
		src/modules/errors/errors.o \
		src/modules/events/events.o \
		src/modules/fs/fs.o \
		src/modules/globals/globals.o \
		src/modules/http/http.o \
		src/modules/https/https.o \
		src/modules/net/net.o \
		src/modules/os/os.o \
		src/modules/path/path.o \
		src/modules/process/process.o \
		src/modules/punycode/punycode.o \
		src/modules/querystring/querystring.o \
		src/modules/readline/readline.o \
		src/modules/repl/repl.o \
		src/modules/stream/stream.o \
		src/modules/string_decoder/string_decoder.o \
		src/modules/timers/timers.o \
		src/modules/tls/tls.o \
		src/modules/tty/tty.o \
		src/modules/url/url.o \
		src/modules/util/util.o \
		src/modules/v8/v8.o \
		src/modules/vm/vm.o \
		src/modules/zlib/zlib.o \
                src/mininode.o

all: mininode

clean:
	-$(RM) $(LIBUV_OBJS) libuv.a
	-$(RM) $(HTTP_PARSER_OBJS) libhttparser.a
	-$(RM) $(MININODE_OBJS) mininode

libuv.a: $(LIBUV_OBJS)
	$(AR) crs $@ $^

libhttparser.a: $(HTTP_PARSER_OBJS)
	$(AR) crs $@ $^
	
mininode: libuv.a libhttparser.a $(MININODE_OBJS)
	$(CC) $^ -o $@

$(LIBUV_OBJS): %.o : %.c $(LIBUV_INCLUDES)
	$(CC) $(LIBUV_CFLAGS) -c -o $@ $<

$(HTTP_PARSER_OBJS): %.o : %.c
	$(CC) $(HTTP_PARSER_CFLAGS) -c -o $@ $<

$(MININODE_OBJS): %.o : %.c
	$(CC) $(MININODE_CFLAGS) -c -o $@ $<
