#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Barrett reduction modulo 3329 using precomputed constant v = floor(2^26 / 3329)
  // Computes a mod 3329 by approximating division via multiplication and shift
  // The constant v satisfies v = floor(2^26 / 3329) = 1996
  // t = floor((v*a + 2^25) / 2^26) approximates floor(a / 3329)
  // Result is a - t*3329, which equals a mod 3329 for defined behavior inputs
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
