#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = (int16_t)((int32_t)v * a >> 26) + (int16_t)(((int32_t)v * a & ((1<<26)-1)) >> 25);
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
