#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Computes a centered representative of a mod 3329 using Barrett reduction.
  // Uses v = 20159 and the same rounding as the reference, with t = floor((v*a + 2^25)/2^26).
  // All arithmetic is in int32_t, so t*3329 (|t| <= 10) never overflows here.
  // The reference wraps t*3329 into int16 and then a - t back into int16.
  // The exact result fits in int16 (about +-1665), so both versions return the same value.
  int32_t t = ((int32_t)20159 * a + (1 << 25)) >> 26;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
