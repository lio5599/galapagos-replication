#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Reduce the magnitude, center it, then restore the input's sign.
  // Centered reduction is odd because the modulus is odd, so no ties occur.
  // Negation happens in int32_t, making -32768 safe as well.
  int32_t x = (int32_t)a;
  int32_t magnitude = x < 0 ? -x : x;
  int32_t r = magnitude % 3329;
  if (r > 1664)
    r -= 3329;
  return (int16_t)(x < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
