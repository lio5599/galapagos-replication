#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // The constant v is recomputed exactly as in the reference: (2^26 + 1664)/3329 = 20159.
  // The quotient is the arithmetic shift floor((v*a + 2^25)/2^26), held in int16 like the reference.
  // The remainder is computed as a + (-3329)*t in int32. It is exact and fits in int16.
  const int32_t v = ((1 << 26) + 3329 / 2) / 3329;
  int16_t t = (int16_t)((v * (int32_t)a + (1 << 25)) >> 26);
  return (int16_t)((int32_t)a + (int32_t)t * -3329);
}


int main(){
    barrett_reduce(0);
}
