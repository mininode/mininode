/* http://nodejs.org/dist/v6.9.2/docs/api/events.html#events_class_eventemitter */

#include "event_emitter.h"

void
mn_event_emitter_init(
  mn_event_emitter_ctx *ctx,
  const mn_event_emitter_class *impl,
  int max_watchers
) {
  ctx->vtable = impl;
  ctx->max_watchers = max_watchers;
  char *path = "/tmp/emitter1";
  //emtr->global_ctx->pid;
  if(mkfifo(path, 0666) == 0) {
    int fd = open(path, O_RDWR);
  }
//  emtr->path = printf("/tmp/mn/%d/emtr/%d\n",
//      emtr->global_ctx->pid,
//      emtr->global_ctx->used_fds
//  );
  // Just a placeholder
//  emtr->size = 128;

};

int
mn_event_emitter_fini(mn_event_emitter_ctx *emtr) {
  printf("MAX_WATCHERS FROM FINALIZER: %d\n", emtr->max_watchers);
  printf("Finalized emitter\n");
  //free(emtr->watchers);
  return 0;
}

void
mn_event_emitter_emit(mn_event_emitter_ctx *emtr, const char *event) {
  printf("MAX_WATCHERS FROM INITIALIZER: %d\n", emtr->max_watchers);
  printf("%s\n", event);
}

const mn_event_emitter_class mn_event_emitter_vtable = {
  sizeof(mn_event_emitter_ctx),
  (void (*)(mn_event_emitter_ctx *, mn_event_emitter_class *impl, int max_watchers)) &mn_event_emitter_init,
  (int (*)(mn_event_emitter_ctx *)) &mn_event_emitter_fini,
  (void (*)(mn_event_emitter_ctx *, const char *)) &mn_event_emitter_emit
};


