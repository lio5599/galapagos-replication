#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Reference: Computes a mod 3329 using Barrett reduction.
  // v is precomputed multiplier for modulus 3329 with k=26 bits.
  // t approximates a/3329 via fixed-point multiplication and shift.
  // Result is a - t*3329, which equals a mod 3329 for |a| < 3329^2.
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;

  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
