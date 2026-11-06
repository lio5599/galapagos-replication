#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Computes the quotient in double: y = (20159*a + 2^25) / 2^26.
  // The numerator is below 2^53 and division by a power of two is exact, so y is exact.
  // Truncation toward zero is corrected to floor when y is negative and non-integral.
  // That gives the same t as the reference's arithmetic shift, so the result is identical.
  double y = ((double)20159 * a + 33554432.0) / 67108864.0;
  int32_t t = (int32_t)y;
  if ((double)t > y)
    t--;
  return (int16_t)(a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
