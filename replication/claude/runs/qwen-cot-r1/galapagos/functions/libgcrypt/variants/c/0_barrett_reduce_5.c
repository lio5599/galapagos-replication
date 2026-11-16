#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Alternative 5: Explicitly cast intermediate to int32_t for safety.
  // v*a can overflow int16_t, so int32_t is necessary.
  // The shift and bias implement fixed-point division by 3329.
  // Final subtraction yields a mod 3329 correctly.
  int16_t t;
  const int16_t v = 3057;

  int32_t temp = (int32_t)v * a + (1<<25);
  t = (int16_t)(temp >> 26);
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
