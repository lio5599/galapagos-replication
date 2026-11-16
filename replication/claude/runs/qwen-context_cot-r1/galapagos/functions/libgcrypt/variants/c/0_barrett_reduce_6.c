#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Barrett reduction: efficient modulo 3329 computation
  // Constant v is derived from 2^26/3329 with rounding for accuracy
  // The expression (v*a + 2^25) >> 26 computes an approximate quotient
  // Multiplying quotient by modulus and subtracting from a gives remainder
  // Works correctly for all int16_t inputs with defined behavior
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
