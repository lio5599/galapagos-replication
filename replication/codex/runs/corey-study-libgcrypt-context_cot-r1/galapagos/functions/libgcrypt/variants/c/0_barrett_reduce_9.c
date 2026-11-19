#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Emulates the reference arithmetic right shift using an unsigned shift.
  // For a negative numerator, unsigned conversion adds 2^32.
  // Subtracting 64 after shifting by 26 removes that contribution exactly.
  // All intermediates fit, and the reference narrowing is preserved.
  int32_t numerator = (int32_t)20159 * a + 33554432;
  int32_t quotient = (int32_t)((uint32_t)numerator >> 26);
  quotient -= numerator < 0 ? 64 : 0;
  int16_t t = (int16_t)quotient;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
