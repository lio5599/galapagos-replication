#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Barrett reduction with v computed as (2^26 + 1664) / 3329
  // The rounding term 3329/2 ensures v is the correctly rounded quotient
  // Shift by 26 after adding 2^25 implements rounding in the division approximation
  // This produces floor(a/3329) approximately, and a - t*3329 gives the remainder
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
