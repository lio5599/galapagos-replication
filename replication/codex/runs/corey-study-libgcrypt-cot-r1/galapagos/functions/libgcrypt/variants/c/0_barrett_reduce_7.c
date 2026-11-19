#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Bitwise long division computes the magnitude's remainder exactly.
  // Each step starts below 3329, so doubling needs at most one subtraction.
  // Sixteen bits cover every magnitude, including 32768; centering is odd.
  int32_t x = (int32_t)a;
  uint32_t magnitude = (uint32_t)(x < 0 ? -x : x);
  uint32_t r = 0;
  int32_t centered;
  int i;
  for (i = 15; i >= 0; --i) {
    r = (r << 1) | ((magnitude >> i) & 1u);
    if (r >= 3329u)
      r -= 3329u;
  }
  centered = (int32_t)r;
  if (centered > 1664)
    centered -= 3329;
  return (int16_t)(x < 0 ? -centered : centered);
}


int main(){
    barrett_reduce(0);
}
