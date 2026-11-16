#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  const int16_t v = ((1<<26) + 3329/2)/3329;
  int32_t t = ((int32_t)v*a + (1<<25)) >> 26;
  int32_t mod = t * 3329;
  return (int16_t)(a - mod);
}


int main(){
    barrett_reduce(0);
}
