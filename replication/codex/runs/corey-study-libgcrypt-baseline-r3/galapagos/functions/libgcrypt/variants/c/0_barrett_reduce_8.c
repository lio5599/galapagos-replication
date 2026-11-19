#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  uint64_t n =
      (uint64_t)((int64_t)a * 20159 + 33554432 + ((int64_t)1 << 32));
  int32_t t = (int32_t)(n >> 26) - 64;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
