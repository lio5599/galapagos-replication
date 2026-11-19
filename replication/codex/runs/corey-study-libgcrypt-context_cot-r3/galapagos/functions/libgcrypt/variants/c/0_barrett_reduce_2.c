#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Split 20159 into 16384 plus 3775 using distributivity.
  // All products and sums fit in int32_t, even at either input endpoint.
  // Identical rounding and narrowing preserve the reference result.
  int16_t t;
  int32_t x = (int32_t)16384 * a + (int32_t)3775 * a;
  t = (x + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
