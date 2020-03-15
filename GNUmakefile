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
CFLAGS ?= -Os -std=gnu99

SRCDIR := $(realpath .)
OBJDIR ?= $(SRCDIR)/obj

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

all: $(OBJDIR)/build/mininode

objdir:
	find "$(SRCDIR)" -type d | sed -e "s?$(SRCDIR)?$(OBJDIR)?" | xargs mkdir -p
	mkdir -p $(OBJDIR)/build

include kconfig/GNUmakefile

CORE_DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d

CORE_CFLAGS = $(CFLAGS)                           \
						-fPIE                                 \
  					-Wall                                 \
						-I$(OBJDIR)/src/include               \
						-I$(SRCDIR)/src/contrib/duktape       \
						-I$(SRCDIR)/src/contrib/http-parser   \
						-I$(SRCDIR)/src/contrib/libuv/include \
						-I$(SRCDIR)/src/include               \
						-DDUK_OPT_VERBOSE_ERRORS              \
						-DDUK_OPT_PARANOID_ERRORS             \
						-DDUK_OPT_AUGMENT_ERRORS              \
						-D_POSIX_C_SOURCE=200809L             \
						-D_GNU_SOURCE                         \
						-D_XOPEN_SOURCE=600

CORE_HDRS = src/include/mininode.h

CORE_SRCS = $(SRCDIR)/src/core/ref.c     \
						$(SRCDIR)/src/core/core.c    \
						$(SRCDIR)/src/core/loader.c  \
						$(SRCDIR)/src/core/mininode.c

CORE_LINKFLAGS = -L$(OBJDIR)/build/ -lm -lpthread -lrt -Wl,--no-as-needed 

$(OBJDIR)/src/include/builtin_hash.h: | objdir
	gperf -N find_builtin -t $(SRCDIR)/src/include/builtin_hash.gperf > $@

#include $(CORE_DEPS)

# In the case of BearSSL, we're just going to rely on their Makefile.
# With code that is so security sensitive, I think it's best to be 
# clear that this project hasn't touched it at all. We just grab it 
# from git and build a static library.
$(OBJDIR)/build/libbearssl.a: $(OBJDIR)
	$(MAKE) AROUT=$(OBJDIR)/ OBJDIR=$(OBJDIR)/src/contrib/BearSSL/obj -C src/contrib/BearSSL lib

-include mk/rules.mk

clean::
	rm -rf $(OBJDIR)/*


