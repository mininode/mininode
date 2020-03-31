#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "mininode.h"

#define MN_SIGFD     1  // 2^0, bit 0
#define LOG_WARNINGS 2  // 2^1, bit 1
#define LOG_NOTICES  4  // 2^2, bit 2
#define LOG_INCOMING 8  // 2^3, bit 3
#define LOG_OUTGOING 16 // 2^4, bit 4
#define LOG_LOOPBACK 32 // and so on...

typedef struct mn_event_emitter_class_ mn_event_emitter_class;
typedef struct mn_event_emitter_ctx_ mn_event_emitter_ctx;

struct mn_event_emitter_ctx_ {
  const mn_event_emitter_class *vtable;
  int fd;
  unsigned char buf[128];
//  struct rb3_head head;
  uint32_t max_watchers;
  uint32_t flags;
};

struct mn_event_emitter_class_ {
  size_t ctx_sz;
  void (*init)(mn_event_emitter_ctx *ctx, mn_event_emitter_class *impl, int max_watchers);
  int (*fini)(mn_event_emitter_ctx *ctx);
  void (*emit)(mn_event_emitter_ctx *ctx, const char *event);
};

typedef struct mn_event_emitter_class_ mn_event_emitter_class;
typedef struct mn_event_emitter_ctx_ mn_event_emitter_ctx;

//void mn_event_emitter_init(mn_event_emitter_ctx *ctx, const mn_event_emitter_class *impl, const mn_ctx *global_ctx, int max_watchers);
//mn_event_emitter_fini(mn_event_emitter_ctx *ctx);
//void mn_event_emitter_emit(mn_event_emitter_ctx *ctx, const char *event);

//extern const mn_event_emitter_class mn_event_emitter_vtable;
