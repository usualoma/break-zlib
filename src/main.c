#include <dlfcn.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  int i;
  void *dl_handle;
  int (*func)();

  for (i = 1; i < argc; i++) {
    dlopen(argv[i], RTLD_LAZY);
  }

  dl_handle = dlopen("./zlib.so", RTLD_LAZY);
  func = dlsym(dl_handle, "init");

  printf("init:%d\n", (*func)());

  return 0;
}
