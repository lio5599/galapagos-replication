#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Uses 20159 = 64 * 315 - 1 without shifting a negative operand.
  // Each multiplication and the biased numerator fit int32_t for all inputs.
  // Quotient and multiple narrowing remain identical to the reference.
  int32_t numerator = (int32_t)a * 315;
  numerator = numerator * 64 - a;
  int16_t t = (numerator + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
