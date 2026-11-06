#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Avoids signed shifts by biasing x = v*a + 2^25 with 11*2^26 so it becomes non-negative.
  // x >= -627015680 > -11*2^26, and x + 11*2^26 <= 1432301889 < 2^32, so it fits in uint32_t.
  // floor((x + 11*2^26)/2^26) - 11 == floor(x/2^26), which equals the reference's t.
  // Then a - 3329*t is computed exactly in int32_t and fits in int16.
  uint32_t u = (uint32_t)((int32_t)20159 * a + 33554432 + 738197504);
  int32_t t = (int32_t)(u >> 26) - 11;
  return (int16_t)(a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
