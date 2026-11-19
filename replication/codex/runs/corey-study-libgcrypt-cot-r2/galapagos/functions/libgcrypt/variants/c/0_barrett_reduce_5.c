#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Bias the reference numerator by ten times its power-of-two divisor.
  // This makes it positive for all int16_t inputs, so the shift is unambiguous.
  // Subtract ten from the quotient to undo the bias exactly.
  // Wide intermediates preserve the centered result at both input endpoints.
  int64_t n = (int64_t)20159 * a + 33554432
            + (int64_t)10 * 67108864;
  int32_t q = (int32_t)(n >> 26) - 10;
  return (int16_t)((int32_t)a - q * 3329);
}


int main(){
    barrett_reduce(0);
}
