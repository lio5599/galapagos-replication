#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Alternative 1: Same logic but compute v inline with explicit cast.
  // The rounding term (1<<25) ensures correct rounding of division.
  // t is the quotient estimate, subtracting t*3329 gives remainder.
  // Equivalent because Barrett reduction formula is preserved exactly.
  int16_t t;
  const int16_t v = (int16_t)(((1<<26) + 3329/2)/3329);

  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
