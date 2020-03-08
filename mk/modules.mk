ifeq ($(CONFIG_MN_MODULE_ASSERT),y)
	MN_MOD_SRCS += src/modules/assert/assert.c
endif

ifeq ($(CONFIG_MN_MODULE_BUFFER),y)
	MN_MOD_SRCS += src/modules/buffer/buffer.c
endif

ifeq ($(CONFIG_MN_MODULE_CHILD_PROCESS),y)
	MN_MOD_SRCS += src/modules/child_process/child_process.c
endif

ifeq ($(CONFIG_MN_MODULE_CLUSTER),y)
	MN_MOD_SRCS += src/modules/cluster/cluster.c
endif

ifeq ($(CONFIG_MN_MODULE_CONSOLE),y)
	MN_MOD_SRCS += src/modules/console/console.c
endif

ifeq ($(CONFIG_MN_MODULE_CRYPTO),y)
	MN_MOD_SRCS += src/modules/crypto/crypto.c
endif

ifeq ($(CONFIG_MN_MODULE_DEBUGGER),y)
	MN_MOD_SRCS += src/modules/debugger/debugger.c
endif

ifeq ($(CONFIG_MN_MODULE_DGRAM),y)
	MN_MOD_SRCS += src/modules/dgram/dgram.c
endif

ifeq ($(CONFIG_MN_MODULE_DNS),y)
	MN_MOD_SRCS += src/modules/dns/dns.c
endif

ifeq ($(CONFIG_MN_MODULE_ERRORS),y)
	MN_MOD_SRCS += src/modules/errors/errors.c
endif

ifeq ($(CONFIG_MN_MODULE_EVENTS),y)
	MN_MOD_SRCS += src/modules/events/events.c
endif

ifeq ($(CONFIG_MN_MODULE_FS),y)
	MN_MOD_SRCS += src/modules/fs/fs.c
endif

ifeq ($(CONFIG_MN_MODULE_HTTP),y)
	MN_MOD_SRCS += src/modules/http/http.c
endif

ifeq ($(CONFIG_MN_MODULE_HTTP2),y)
	MN_MOD_SRCS += src/modules/http2/http2.c
endif

ifeq ($(CONFIG_MN_MODULE_HTTPS),y)
	MN_MOD_SRCS += src/modules/https/https.c
endif

ifeq ($(CONFIG_MN_MODULE_NET),y)
	MN_MOD_SRCS += src/modules/net/net.c
endif

ifeq ($(CONFIG_MN_MODULE_OS),y)
	MN_MOD_SRCS += src/modules/os/os.c
endif

ifeq ($(CONFIG_MN_MODULE_PATH),y)
	MN_MOD_SRCS += src/modules/path/path.c
endif

ifeq ($(CONFIG_MN_MODULE_PROCESS),y)
	MN_MOD_SRCS += src/modules/process/process.c
endif

ifeq ($(CONFIG_MN_MODULE_PUNYCODE),y)
	MN_MOD_SRCS += src/modules/punycode/punycode.c
endif

ifeq ($(CONFIG_MN_MODULE_QUERYSTRING),y)
	MN_MOD_SRCS += src/modules/querystring/querystring.c
endif

ifeq ($(CONFIG_MN_MODULE_READLINE),y)
	MN_MOD_SRCS += src/modules/readline/readline.c
endif

ifeq ($(CONFIG_MN_MODULE_REPL),y)
	MN_MOD_SRCS += src/modules/repl/repl.c
endif

ifeq ($(CONFIG_MN_MODULE_STREAM),y)
	MN_MOD_SRCS += src/modules/stream/stream.c
endif

ifeq ($(CONFIG_MN_MODULE_STRING_DECODER),y)
	MN_MOD_SRCS += src/modules/decoder/decoder.c
endif

ifeq ($(CONFIG_MN_MODULE_TIMERS),y)
	MN_MOD_SRCS += src/modules/timers/timers.c
endif

ifeq ($(CONFIG_MN_MODULE_TLS),y)
	MN_MOD_SRCS += src/modules/tls/tls.c
endif

ifeq ($(CONFIG_MN_MODULE_TTY),y)
	MN_MOD_SRCS += src/modules/tty/tty.c
endif

ifeq ($(CONFIG_MN_MODULE_URL),y)
	MN_MOD_SRCS += src/modules/url/url.c
endif

ifeq ($(CONFIG_MN_MODULE_UTIL),y)
	MN_MOD_SRCS += src/modules/util/util.c
endif

ifeq ($(CONFIG_MN_MODULE_V8),y)
	MN_MOD_SRCS += src/modules/v8/v8.c
endif

ifeq ($(CONFIG_MN_MODULE_VM),y)
	MN_MOD_SRCS += src/modules/vm/vm.c
endif

ifeq ($(CONFIG_MN_MODULE_ZLIB),y)
	MN_MOD_SRCS += src/modules/zlib/zlib.c
endif

MN_MOD_OBJS = $(subst $(SRCDIR),$(OBJDIR),$(MN_MOD_SRCS:.c=.o))

MN_MOD_DEPS = $(MN_MOD_OBJS:.o=.d)
include $(LIBUV_DEPS)

$(MN_MOD_DEPS): $(OBJDIR) $(CORE_SRCS) $(MN_MOD_SRCS) $(MN_HDRS) $(OBJDIR)/src/include/builtin_hash.h
	$(CC) -MMD $(CORE_CFLAGS) $^ >$@

$(OBJDIR)/src/modules/%.o: | $(OBJDIR)
	$(CC) $(CORE_CFLAGS) -c -o $@ $(subst $(OBJDIR),$(SRCDIR),$(@:.o=.c))


