#include <stdlib.h>
#include <zlib.h>

void *my_zcalloc(void *opaque, unsigned items, unsigned size) {
  return malloc(items * size);
}

void my_zcfree(void *opaque, void *ptr) {
  free(ptr);
  return;
}

int init() {
  z_stream stream = {
    zalloc : &my_zcalloc,
    zfree : &my_zcfree,
  };

  return inflateInit2(&stream, 15);
}
