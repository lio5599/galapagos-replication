#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Same quotient estimate, computed in 64-bit arithmetic.
  // v*a + 2^25 lies in [-627015680, 694104385], so int64 holds it exactly.
  // An arithmetic >> 26 gives the same floor as the reference's 32-bit shift.
  // a - 3329*t is exact and lies in int16 range, so the cast matches the reference's wrapped result.
  int64_t x = (int64_t)20159 * a + 33554432;
  int64_t t = x >> 26;
  return (int16_t)(a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
