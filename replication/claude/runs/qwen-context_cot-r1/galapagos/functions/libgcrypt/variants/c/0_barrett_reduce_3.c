#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Equivalent Barrett reduction modulo 3329
  // Uses fixed-point multiplication to approximate division by 3329
  // v is precomputed as floor(2^26/3329) with rounding
  // The addition of 2^25 before right shift by 26 implements proper rounding
  // Final subtraction yields a mod 3329
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
