#include <stdint.h>
#include <stdbool.h>

/* Semantic versioning, per mainline Node.js */
#define MININODE_VERSION "0.0.1"
/* Timeout values > TIMEOUT_MAX are set to 1. */
#define TIMEOUT_MAX 2147483647

typedef struct {
	char *domain;
} mn_domain;

typedef struct {
	/* '0' */
	/* listOnTimeout */
	/* _list */
} mn_timer;

typedef struct {
	void *_idleNext;
	void *_idlePrev;
	void *_timer;
	bool unrefed;
	uint64_t msecs;
} mn_timers_list;

typedef struct {
	bool _called;
	uint64_t _idleTimeout;

} mn_timeout;