#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Replace the arithmetic shift with division rounded toward negative infinity.
  // For a negative numerator, subtract divisor minus one before C division.
  // This correction fits in int32_t and handles exact multiples correctly.
  // The quotient and both int16_t conversions match the reference.
  int16_t t;
  int32_t x = (int32_t)20159 * a + 33554432;
  if (x < 0)
    x -= 67108863;
  t = x / 67108864;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
