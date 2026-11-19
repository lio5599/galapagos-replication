#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // The reference subtracts 3329 times a rounded approximate quotient from a.
  // Its reciprocal constant evaluates to 20159.
  // The numerator fits in int32_t for every int16_t input.
  // Preserve both int16_t conversions, including endpoint wraparound.
  int16_t t;
  t = ((int32_t)20159 * a + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
