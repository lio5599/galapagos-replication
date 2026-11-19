#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Split 20159 into 20000 plus 159 before multiplying.
  // The exact sum and all intermediates fit in int32_t.
  // Preserve the reference's rounding and int16_t conversions.
  int32_t product = (int32_t)20000 * a + (int32_t)159 * a;
  int16_t t = (product + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
