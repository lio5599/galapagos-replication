#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t t;
  const int32_t v = ((1 << 26) + 3329 / 2) / 3329;

  t = (v * (int32_t)a + (1 << 25)) >> 26;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
