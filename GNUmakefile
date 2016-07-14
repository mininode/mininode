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
    LIBUV_OBJS += src/contrib/libuv/src/unix/async.o \
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
    else ifeq ($(UNAME_S),Darwin)
        LIBUV_OBJS += src/contrib/libuv/src/unix/core.o \
                      src/contrib/libuv/src/unix/darwin.o \
	              src/contrib/libuv/src/unix/darwin-proctitle.o \
		      src/contrib/libuv/src/unix/kqueue.o \
		      src/contrib/libuv/src/unix/fsevents.o
    else ifeq ($(UNAME_S),SunOS)
        # TBD
    endif
endif

MBEDTLS_CFLAGS += $(CFLAGS) \
                -Wall \
                -Wextra \
                -Wno-unused-parameter \
	        -Isrc/contrib/mbedtls/include

# FIXME: All of these mbedtls objects aren't necessary.
MBEDTLS_OBJS += src/contrib/mbedtls/library/aes.o \
                src/contrib/mbedtls/library/aesni.o \
		src/contrib/mbedtls/library/arc4.o \
		src/contrib/mbedtls/library/asn1parse.o \
		src/contrib/mbedtls/library/asn1write.o \
		src/contrib/mbedtls/library/base64.o \
		src/contrib/mbedtls/library/bignum.o \
		src/contrib/mbedtls/library/blowfish.o \
		src/contrib/mbedtls/library/camellia.o \
		src/contrib/mbedtls/library/ccm.o \
		src/contrib/mbedtls/library/certs.o \
		src/contrib/mbedtls/library/cipher.o \
		src/contrib/mbedtls/library/cipher_wrap.o \
		src/contrib/mbedtls/library/ctr_drbg.o \
		src/contrib/mbedtls/library/debug.o \
		src/contrib/mbedtls/library/des.o \
		src/contrib/mbedtls/library/dhm.o \
		src/contrib/mbedtls/library/ecdh.o \
		src/contrib/mbedtls/library/ecjpake.o \
		src/contrib/mbedtls/library/ecp.o \
		src/contrib/mbedtls/library/ecp_curves.o \
		src/contrib/mbedtls/library/entropy.o \
		src/contrib/mbedtls/library/entropy_poll.o \
		src/contrib/mbedtls/library/error.o \
		src/contrib/mbedtls/library/gcm.o \
		src/contrib/mbedtls/library/havege.o \
		src/contrib/mbedtls/library/hmac_drbg.o \
		src/contrib/mbedtls/library/md.o \
		src/contrib/mbedtls/library/md2.o \
		src/contrib/mbedtls/library/md4.o \
		src/contrib/mbedtls/library/md5.o \
		src/contrib/mbedtls/library/md_wrap.o \
		src/contrib/mbedtls/library/memory_buffer_alloc.o \
		src/contrib/mbedtls/library/net.o \
		src/contrib/mbedtls/library/oid.o \
		src/contrib/mbedtls/library/padlock.o \
		src/contrib/mbedtls/library/pem.o \
		src/contrib/mbedtls/library/pk.o \
		src/contrib/mbedtls/library/pk_wrap.o \
		src/contrib/mbedtls/library/pkcs11.o \
		src/contrib/mbedtls/library/pkcs12.o \
		src/contrib/mbedtls/library/pkcs5.o \
		src/contrib/mbedtls/library/pkparse.o \
		src/contrib/mbedtls/library/pkwrite.o \
		src/contrib/mbedtls/library/platform.o \
		src/contrib/mbedtls/library/ripemd160.o \
		src/contrib/mbedtls/library/rsa.o \
		src/contrib/mbedtls/library/sha1.o \
		src/contrib/mbedtls/library/sha256.o \
		src/contrib/mbedtls/library/sha512.o \
		src/contrib/mbedtls/library/ssl_cache.o \
		src/contrib/mbedtls/library/ssl_ciphersuites.o \
		src/contrib/mbedtls/library/ssl_cli.o \
		src/contrib/mbedtls/library/ssl_cookie.o \
		src/contrib/mbedtls/library/ssl_srv.o \
		src/contrib/mbedtls/library/ssl_ticket.o \
		src/contrib/mbedtls/library/ssl_tls.o \
		src/contrib/mbedtls/library/threading.o \
		src/contrib/mbedtls/library/timing.o \
		src/contrib/mbedtls/library/version.o \
		src/contrib/mbedtls/library/version_features.o \
		src/contrib/mbedtls/library/x509.o \
		src/contrib/mbedtls/library/x509_create.o \
		src/contrib/mbedtls/library/x509_crl.o \
		src/contrib/mbedtls/library/x509_crt.o \
		src/contrib/mbedtls/library/x509_csr.o \
		src/contrib/mbedtls/library/x509write_crt.o \
		src/contrib/mbedtls/library/x509write_csr.o \
		src/contrib/mbedtls/library/xtea.o


MININODE_CFLAGS = $(CFLAGS) \
                  -Wall \
                  -Isrc/contrib/duktape \
		  -Isrc/contrib \
		  -Isrc/contrib/libz \
		  -Isrc/modules \
		  -Isrc/contrib/libuv/include/ \
		  -Isrc/include \
		  -DDUK_USE_DEBUGGER_SUPPORT \
		  -DDUK_USE_DEBUGGER_FWD_LOGGING \
		  -D_XOPEN_SOURCE=600 \
		  -DMINIZ_NO_TIME

MININODE_INCLUDES = src/include/mininode.h \
                    src/include/modules.h \
		    src/include/builtin_hash.h

MININODE_MOD_SRCS = $(call rwildcard, src/modules/,*.c)
MININODE_MOD_OBJS = $(MININODE_MOD_SRCS:.c=.o)

MININODE_OBJS = src/contrib/duktape/duktape.o \
                src/mininode.o

all: mininode

clean:
	-$(RM) $(LIBUV_OBJS) libuv.a
	-$(RM) $(HTTP_PARSER_OBJS) libhttparser.a
	-$(RM) $(MBEDTLS_OBJS) libmbedtls.a
	-$(RM) $(MININODE_MOD_OBJS)
	-$(RM) $(MININODE_OBJS) mininode

libuv.a: $(LIBUV_OBJS)
	$(AR) crs $@ $^

libhttparser.a: $(HTTP_PARSER_OBJS)
	$(AR) crs $@ $^

libmbedtls.a: $(MBEDTLS_OBJS)
	$(AR) crs $@ $^

src/include/builtin_hash.h: src/include/builtin_hash.gperf
	gperf -N find_builtin -t $< > $@

mininode: libuv.a libhttparser.a libmbedtls.a $(MININODE_OBJS) $(MININODE_MOD_OBJS)
	$(CC) $^ -o $@

$(LIBUV_OBJS): %.o : %.c $(LIBUV_INCLUDES)
	$(CC) $(LIBUV_CFLAGS) -c -o $@ $<

$(HTTP_PARSER_OBJS): %.o : %.c
	$(CC) $(HTTP_PARSER_CFLAGS) -c -o $@ $<

$(MBEDTLS_OBJS): %.o : %.c
	$(CC) $(MBEDTLS_CFLAGS) -c -o $@ $<

$(MININODE_MOD_OBJS): %.o : %.c $(MININODE_INCLUDES)
	$(CC) $(MININODE_CFLAGS) -c -o $@ $<

$(MININODE_OBJS): %.o : %.c $(MININODE_INCLUDES)
	$(CC) $(MININODE_CFLAGS) -c -o $@ $<
