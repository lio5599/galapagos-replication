#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Same quotient estimate, but the shift by 26 is split into shifts by 10 and 16.
  // floor(floor(x/2^10)/2^16) == floor(x/2^26) for arithmetic shifts, including negative x.
  // The final subtraction is done in int32. The exact result fits in int16, so truncation matches.
  int32_t x = (int32_t)a * 20159 + (1 << 25);
  int32_t t = (x >> 10) >> 16;
  return (int16_t)(a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
