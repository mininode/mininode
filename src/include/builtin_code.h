#ifndef __BUILTIN_CODE_H
#define __BUILTIN_CODE_H
struct builtin_code
  {
  enum
    {
    ASSERT_MODULE = 1,
    BUFFER_MODULE = 2,
    CHILD_PROCESS_MODULE = 3,
    CLUSTER_MODULE = 4,
    CRYPTO_MODULE = 5,
    DEBUGGER_MODULE = 6,
    DGRAM_MODULE = 7,
    DNS_MODULE = 8,
    EVENTS_MODULE = 9,
    FS_MODULE = 10,
    HTTP_MODULE = 11,
    HTTPS_MODULE = 12,
    NET_MODULE = 13,
    OS_MODULE = 14,
    PATH_MODULE = 15,
    PROCESS_MODULE = 16,
    PUNYCODE_MODULE = 17,
    QUERYSTRING_MODULE = 18,
    READLINE_MODULE = 19,
    REPL_MODULE = 20,
    STREAM_MODULE = 21,
    STRING_DECODER_MODULE = 22,
    TLS_MODULE = 23,
    TTY_MODULE = 24,
    URL_MODULE = 25,
    UTIL_MODULE = 26,
    V8_MODULE = 27,
    VM_MODULE = 28,
    ZLIB_MODULE = 29
    };
  };
#endif