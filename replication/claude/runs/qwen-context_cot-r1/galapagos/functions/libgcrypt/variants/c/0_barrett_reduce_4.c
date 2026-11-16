#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Barrett modular reduction for modulus 3329
  // Precomputed multiplier v enables division-free modulo operation
  // Cast to int32_t prevents overflow during intermediate multiplication
  // Right shift by 26 divides by 2^26, approximating division by 3329
  // Result a - t*3329 is congruent to a mod 3329
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
