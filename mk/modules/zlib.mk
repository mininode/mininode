ZLIB_SRCS = $(SRCDIR)/src/modules/zlib/zlib.c \
						$(SRCDIR)/src/modules/zlib/methods/create_deflate.c \
						$(SRCDIR)/src/modules/zlib/methods/create_deflate_raw.c \
						$(SRCDIR)/src/modules/zlib/methods/create_gunzip.c \
						$(SRCDIR)/src/modules/zlib/methods/create_gzip.c \
						$(SRCDIR)/src/modules/zlib/methods/create_inflate.c \
						$(SRCDIR)/src/modules/zlib/methods/create_inflate_raw.c \
						$(SRCDIR)/src/modules/zlib/methods/create_unzip.c \
						$(SRCDIR)/src/modules/zlib/methods/deflate.c \
						$(SRCDIR)/src/modules/zlib/methods/deflate_raw.c \
						$(SRCDIR)/src/modules/zlib/methods/deflate_raw_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/deflate_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/gunzip.c \
						$(SRCDIR)/src/modules/zlib/methods/gunzip_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/gzip.c \
						$(SRCDIR)/src/modules/zlib/methods/gzip_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/inflate.c \
						$(SRCDIR)/src/modules/zlib/methods/inflate_raw.c \
						$(SRCDIR)/src/modules/zlib/methods/inflate_raw_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/inflate_sync.c \
						$(SRCDIR)/src/modules/zlib/methods/options.c \
						$(SRCDIR)/src/modules/zlib/methods/unzip.c \
						$(SRCDIR)/src/modules/zlib/methods/unzip_sync.c

$(foreach file,$(ZLIB_SRCS),$(eval $(call generateRule,$(file),CORE_OBJS)))

