# Copyright (c) 2013 Ben Noordhuis <info@bnoordhuis.nl>
# Copyright (c) 2020 Alex Caudill <alex.caudill@pm.me>
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

VERSION = 0
PATCHLEVEL = 0
SUBLEVEL = 1
EXTRAVERSION = rc0
NAME = Cryptocratic Kitten

CC ?= gcc
AR ?= ar
RM ?= rm
CFLAGS ?= -O2 -std=gnu99

MININODEVERSION=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-$(EXTRAVERSION)
KCONFIG_CONFIG ?= .config
export MININODEVERSION
export KCONFIG_CONFIG

# Do not:
# o  use make's built-in rules and variables
#    (this increases performance and avoids hard-to-debug behaviour);
# o  print "Entering directory ...";
MAKEFLAGS += -rR --no-print-directory

# Avoid funny character set dependencies
unexport LC_ALL
LC_COLLATE=C
LC_NUMERIC=C
export LC_COLLATE LC_NUMERIC

# Avoid interference with shell env settings
unexport GREP_OPTIONS


ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

# Read KERNELRELEASE from include/config/kernel.release (if it exists)
KERNELRELEASE = $(shell cat include/config/mininode.release 2> /dev/null)
KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)

all: mininode

include kconfig/GNUmakefile

#Recursive wildcard!
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))

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

HTTP_PARSER_CFLAGS = $(CFLAGS)

HTTP_PARSER_OBJS = src/contrib/http-parser/http_parser.o


MBEDTLS_CFLAGS += $(CFLAGS) \
                -Wall \
                -Wextra \
                -Wno-unused-parameter \
								-Isrc/contrib/mbedtls/include

MN_CFLAGS = $(CFLAGS) \
						-Wall \
						-Isrc/contrib/duktape \
						-Isrc/contrib \
						-Isrc/contrib/libz \
						-Isrc/modules \
						-Isrc/contrib/libuv/include/ \
						-Isrc/include \
						-DDUK_OPT_VERBOSE_ERRORS \
						-DDUK_OPT_PARANOID_ERRORS \
						-DDUK_OPT_AUGMENT_ERRORS \
						-D_POSIX_C_SOURCE=200809L \
						-D_XOPEN_SOURCE=600

MN_INCLUDES = src/include/mininode.h \
							src/include/builtin_hash.h

MN_MOD_SRCS = $(call rwildcard, src/modules/,*.c)
MN_MOD_OBJS = $(MN_MOD_SRCS:.c=.o)

MN_OBJS = src/contrib/duktape/duktape.o \
					src/util/ref.o \
					src/util/util.o \
					src/util/loader.o \
					src/mininode.o

ifeq ($(OS),Windows_NT)
$(error Windows targets are unsupported.)
else
    LIBUV_OBJS += src/contrib/libuv/src/threadpool.o \
                  src/contrib/libuv/src/unix/async.o \
									src/contrib/libuv/src/unix/dl.o \
									src/contrib/libuv/src/unix/fs.o \
									src/contrib/libuv/src/unix/getaddrinfo.o \
									src/contrib/libuv/src/unix/getnameinfo.o \
									src/contrib/libuv/src/unix/loop-watcher.o \
									src/contrib/libuv/src/unix/loop.o \
									src/contrib/libuv/src/unix/pipe.o \
									src/contrib/libuv/src/unix/process.o \
									src/contrib/libuv/src/unix/signal.o \
									src/contrib/libuv/src/unix/stream.o \
									src/contrib/libuv/src/unix/tcp.o \
									src/contrib/libuv/src/unix/thread.o \
									src/contrib/libuv/src/unix/timer.o \
									src/contrib/libuv/src/unix/tty.o \
									src/contrib/libuv/src/unix/udp.o \
									src/contrib/libuv/src/version.o \
									src/contrib/libuv/src/inet.o \
									src/contrib/libuv/src/fs-poll.o \
									src/contrib/libuv/src/unix/proctitle.o \
									src/contrib/libuv/src/uv-common.o

    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        LIBUV_OBJS += src/contrib/libuv/src/unix/linux-core.o \
											src/contrib/libuv/src/unix/linux-inotify.o \
											src/contrib/libuv/src/unix/linux-syscalls.o \
											src/contrib/libuv/src/unix/core.o \
											src/contrib/libuv/src/unix/poll.o
        LIBUV_CFLAGS += -fPIC

    else ifeq ($(UNAME_S),Darwin)
        LIBUV_OBJS += src/contrib/libuv/src/unix/core.o \
                      src/contrib/libuv/src/unix/darwin.o \
											src/contrib/libuv/src/unix/darwin-proctitle.o \
											src/contrib/libuv/src/unix/kqueue.o \
											src/contrib/libuv/src/unix/fsevents.o \
											src/contrib/libuv/src/unix/pthread-barrier.o \
											src/contrib/libuv/src/unix/pthread-fixes.o \
											src/contrib/libuv/src/unix/poll.o

    else ifeq ($(UNAME_S),SunOS)
        # TBD
    endif
endif


clean::
	rm -f src/include/builtin_hash.h
	rm -f $(LIBUV_OBJS) libuv.a
	rm -f $(HTTP_PARSER_OBJS) libhttparser.a
	rm -f $(MBEDTLS_OBJS) libmbedtls.a
	rm -f $(MN_MOD_OBJS)
	rm -f $(MN_OBJS) mininode

libuv.a: $(LIBUV_OBJS)
	ar crs $@ $^

libhttparser.a: $(HTTP_PARSER_OBJS)
	ar crs $@ $^

src/include/builtin_hash.h: src/include/builtin_hash.gperf
	gperf -N find_builtin -t $< > $@

MN_LINKFLAGS = -L. -luv -lhttparser -lm -lpthread 
ifeq ($(UNAME_S),Linux)
MN_LINKFLAGS += -lrt -Wl,--no-as-needed 
endif

mininode: libuv.a libhttparser.a $(MN_OBJS) $(MN_MOD_OBJS)
	$(CC) $(MN_OBJS) $(MN_MOD_OBJS) $(MN_LINKFLAGS) -o $@

$(LIBUV_OBJS): %.o : %.c $(LIBUV_INCLUDES)
	$(CC) $(LIBUV_CFLAGS) -c -o $@ $<

$(HTTP_PARSER_OBJS): %.o : %.c
	$(CC) $(HTTP_PARSER_CFLAGS) -c -o $@ $<

$(MN_MOD_OBJS): %.o : %.c $(MN_INCLUDES)
	$(CC) $(MN_CFLAGS) -c -o $@ $<

$(MN_OBJS): %.o : %.c $(MN_INCLUDES)
	$(CC) $(MN_CFLAGS) -c -o $@ $<
