#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Subtracts 3329 times the rounded fixed-point quotient, with int16_t narrowing.
  // The reference reciprocal is exactly 20159.
  // Keeping both narrowing steps preserves behavior at the input extremes.
  int16_t t;
  t = ((int32_t)20159 * a + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
