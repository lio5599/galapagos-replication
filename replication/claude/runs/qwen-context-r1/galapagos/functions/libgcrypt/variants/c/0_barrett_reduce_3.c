#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  int32_t prod = (int32_t)v * a;
  int32_t shifted = (prod + (1<<25)) >> 26;
  t = (int16_t)shifted;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
