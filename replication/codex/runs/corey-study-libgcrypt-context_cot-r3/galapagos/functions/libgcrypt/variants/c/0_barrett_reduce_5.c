#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Translate the input to the nonnegative range before multiplication.
  // Subtracting the translated bias restores the exact reference numerator.
  // The largest product is 20159 times 65535, which fits in int32_t.
  // The final shift and narrowing operations match the reference.
  int16_t t;
  int32_t x = (int32_t)a + 32768;
  x = 20159 * x - ((int32_t)20159 * 32768 - 33554432);
  t = x >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
