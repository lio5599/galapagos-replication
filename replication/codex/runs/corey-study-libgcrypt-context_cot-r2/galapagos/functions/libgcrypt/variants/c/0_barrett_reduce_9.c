#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Compute the same rounded quotient, then split 3329 into 3328 plus 1.
  // The quotient is between -10 and 10, so int32_t arithmetic is exact.
  // Narrow the complete product, preserving wraparound at the extremes.
  int16_t t = ((int32_t)20159 * a + 33554432) >> 26;
  t = (int16_t)((int32_t)t * 3328 + t);
  return a - t;
}


int main(){
    barrett_reduce(0);
}
