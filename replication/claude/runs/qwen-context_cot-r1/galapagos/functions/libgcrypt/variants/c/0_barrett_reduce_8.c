#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Barrett algorithm for computing a mod 3329
  // v is the fixed-point representation of 1/3329 scaled by 2^26
  // The scaling factor 2^26 is chosen to provide sufficient precision
  // Adding 2^25 implements round-to-nearest in the quotient computation
  // The difference a - t*3329 yields the correct remainder
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
