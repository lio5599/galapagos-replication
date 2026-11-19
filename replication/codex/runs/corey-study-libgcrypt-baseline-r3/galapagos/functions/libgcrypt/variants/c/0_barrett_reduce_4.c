#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t x = a;
  int32_t n = x * 16384 + x * 4096 - x * 256 - x * 64 - x;
  int32_t t = (n + 33554432) >> 26;
  return (int16_t)(x - t * 3329);
}


int main(){
    barrett_reduce(0);
}
