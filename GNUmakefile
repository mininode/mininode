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
LD ?= ld
AR ?= ar
RM ?= rm
CFLAGS ?= -O2 -std=gnu99

SRCDIR := $(realpath .)
OBJDIR ?= $(SRCDIR)/obj
DSTDIR ?= /usr/local/bin

KCONFIG_CONFIG ?= .config
export MININODEVERSION
export KCONFIG_CONFIG

include $(KCONFIG_CONFIG)
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

MININODEVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)

UNAME_S := $(shell uname -s)

define generateRule
$2 += $(patsubst %.c, %.o, $(subst $(SRCDIR), $(OBJDIR), ${1}))
$3 += $(patsubst %.c, %.d, $(subst $(SRCDIR), $(OBJDIR), ${1}))
$(patsubst %.c, %.o, $(subst $(SRCDIR), $(OBJDIR), ${1})): $(1) | objdir
	$$(CC) -c -fPIC $$(CORE_CFLAGS) $$(filter-out %.h,$$^) -o $$@ -MQ $$@ -MMD -MP -MF$(patsubst %.c, %.d, $(subst $(SRCDIR), $(OBJDIR), ${1})) 
endef

all: $(OBJDIR)/build/mininode

objdir:
	find "$(SRCDIR)" -type d | sed -e "s?$(SRCDIR)?$(OBJDIR)?" | xargs mkdir -p
	mkdir -p $(OBJDIR)/build

include kconfig/GNUmakefile

CORE_CFLAGS = $(CFLAGS)                            \
  					-Wall                                  \
						-I$(OBJDIR)/src/include                \
						-I$(SRCDIR)/src/contrib/duktape        \
						-I$(SRCDIR)/src/contrib/libtuv/include \
						-I$(SRCDIR)/src/contrib/libtuv/src \
						-I$(SRCDIR)/src/contrib/libtuv/src/unix \
						-I$(SRCDIR)/src/contrib/http-parser    \
						-I$(SRCDIR)/src/include                \
						-DDUK_OPT_VERBOSE_ERRORS               \
						-DDUK_OPT_PARANOID_ERRORS              \
						-DDUK_OPT_AUGMENT_ERRORS               \
						-D_POSIX_C_SOURCE=200809L              \
						-D_GNU_SOURCE                          \
						-D_XOPEN_SOURCE=700                    \
						-fomit-frame-pointer                   \
						-fstack-protector                      \
						-flto                                  \
						-fno-asynchronous-unwind-tables        \
						-fno-prefetch-loop-arrays              \
						-freorder-blocks-algorithm=simple      \
						-mno-align-stringops                   \
						-fno-align-loops                       \
						-fno-align-labels                      \
						-fno-align-jumps                      \
						-ffunction-sections

CORE_HDRS = src/include/mininode.h

CORE_SRCS = $(SRCDIR)/src/core/ref.c     \
						$(SRCDIR)/src/core/rb3ptr.c \
						$(SRCDIR)/src/core/core.c    \
						$(SRCDIR)/src/core/loader.c  \
						$(SRCDIR)/src/core/mininode.c

OBJECTS =
DEPENDS =

CORE_LINKFLAGS = -L$(OBJDIR)/build/ -lm -lpthread -lrt -Wl,--no-as-needed -Wl,--gc-sections

%.o: %.c
	$(CC) $(CORE_CFLAGS) $(CORE_DEPFLAGS) $^ -o $@

$(OBJDIR)/src/include/builtin_hash.gperf: | objdir
	cp $(SRCDIR)/src/include/builtin_hash.gperf $(OBJDIR)/src/include/builtin_hash.gperf

$(OBJDIR)/src/include/builtin_hash.h: $(OBJDIR)/src/include/builtin_hash.gperf
	gperf -N find_builtin -t $^ > $@

include mk/contrib/duktape.mk
include mk/contrib/libtuv.mk

ifeq ($(CONFIG_CONTRIB_HTTP_PARSER),y)
	include mk/contrib/httparser.mk
endif
ifeq ($(CONFIG_CONTRIB_BEARSSL),y)
	include mk/contrib/bearssl.mk
endif
ifeq ($(CONFIG_CONTRIB_LIBSLZ),y)
	include mk/contrib/libslz.mk
endif
ifeq ($(CONFIG_CONTRIB_LOWZIP),y)
	include mk/contrib/lowzip.mk
endif
ifeq ($(CONFIG_CONTRIB_LIBCARES),y)
	include mk/contrib/libcares.mk
endif

ifeq ($(CONFIG_MODULE_ASSERT),y)
	include mk/modules/assert.mk
endif
ifeq ($(CONFIG_MODULE_BUFFER),y)
	include mk/modules/buffer.mk
endif
ifeq ($(CONFIG_MODULE_CHILD_PROCESS),y)
	include mk/modules/child_process.mk
endif
ifeq ($(CONFIG_MODULE_CONSOLE),y)
	include mk/modules/console.mk
endif
ifeq ($(CONFIG_MODULE_CLUSTER),y)
	include mk/modules/cluster.mk
endif
ifeq ($(CONFIG_MODULE_CRYPTO),y)
	include mk/modules/crypto.mk
endif
ifeq ($(CONFIG_MODULE_DEBUGGER),y)
	include mk/modules/debugger.mk
endif
ifeq ($(CONFIG_MODULE_DGRAM),y)
	include mk/modules/dgram.mk
endif
ifeq ($(CONFIG_MODULE_DNS),y)
	include mk/modules/dns.mk
endif
ifeq ($(CONFIG_MODULE_ERRORS),y)
	include mk/modules/errors.mk
endif
ifeq ($(CONFIG_MODULE_EVENTS),y)
	include mk/modules/events.mk
endif
ifeq ($(CONFIG_MODULE_FS),y)
	include mk/modules/fs.mk
endif
ifeq ($(CONFIG_MODULE_HTTP),y)
	include mk/modules/http.mk
endif
ifeq ($(CONFIG_MODULE_HTTP2),y)
	include mk/modules/http2.mk
endif
ifeq ($(CONFIG_MODULE_HTTPS),y)
	include mk/modules/https.mk
endif
ifeq ($(CONFIG_MODULE_NET),y)
	include mk/modules/net.mk
endif
ifeq ($(CONFIG_MODULE_OS),y)
	include mk/modules/os.mk
endif
ifeq ($(CONFIG_MODULE_PATH),y)
	include mk/modules/path.mk
endif
ifeq ($(CONFIG_MODULE_PROCESS),y)
	include mk/modules/process.mk
endif
ifeq ($(CONFIG_MODULE_PUNYCODE),y)
	include mk/modules/punycode.mk
endif
ifeq ($(CONFIG_MODULE_QUERYSTRING),y)
	include mk/modules/querystring.mk
endif
ifeq ($(CONFIG_MODULE_READLINE),y)
	include mk/modules/readline.mk
endif
ifeq ($(CONFIG_MODULE_REPL),y)
	include mk/modules/repl.mk
endif
ifeq ($(CONFIG_MODULE_STREAM),y)
	include mk/modules/stream.mk
endif
ifeq ($(CONFIG_MODULE_STRING_DECODER),y)
	include mk/modules/string_decoder.mk
endif
ifeq ($(CONFIG_MODULE_TIMERS),y)
	include mk/modules/timers.mk
endif
ifeq ($(CONFIG_MODULE_TLS),y)
	include mk/modules/tls.mk
endif
ifeq ($(CONFIG_MODULE_TTY),y)
	include mk/modules/tty.mk
endif
ifeq ($(CONFIG_MODULE_URL),y)
	include mk/modules/url.mk
endif
ifeq ($(CONFIG_MODULE_UTIL),y)
	include mk/modules/util.mk
endif
ifeq ($(CONFIG_MODULE_V8),y)
	include mk/modules/v8.mk
endif
ifeq ($(CONFIG_MODULE_VM),y)
	include mk/modules/vm.mk
endif
ifeq ($(CONFIG_MODULE_ZLIB),y)
	include mk/modules/zlib.mk
endif

$(foreach file,$(CORE_SRCS),$(eval $(call generateRule,$(file),OBJECTS,DEPENDS)))

-include $(DEPENDS)

$(OBJDIR)/build/mininode: $(OBJDIR)/src/include/builtin_hash.h $(OBJDIR)/build/libduktape.a $(OBJDIR)/build/libtuv.a $(OBJECTS) | objdir 
	$(CC) $(CORE_CFLAGS) -flto -fPIE $(OBJECTS) -L$(OBJDIR)/build -l:libtuv.a -l:libduktape.a -lpthread -ldl -lm -o $@

clean::
	rm -rf $(OBJDIR)/*

.config:
	touch .config
	make defconfig

install:
	cp $(OBJDIR)/build/mininode $(DSTDIR)/mininode
