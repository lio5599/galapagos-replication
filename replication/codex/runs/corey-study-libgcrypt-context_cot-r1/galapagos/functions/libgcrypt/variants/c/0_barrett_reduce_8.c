#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Stages the rounding using arithmetic right shifts, as in the reference.
  // floor((p + 2^25)/2^26) equals floor((floor(p/2^25) + 1)/2).
  // This identity includes negative products and exact rounding boundaries.
  // All intermediates fit, and both int16_t narrowing steps are retained.
  int32_t product = (int32_t)20159 * a;
  int32_t coarse = product >> 25;
  int16_t t = (coarse + 1) >> 1;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
