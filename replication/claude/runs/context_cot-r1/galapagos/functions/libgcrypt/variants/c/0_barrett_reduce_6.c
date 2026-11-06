#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // The reference effectively computes a - 3329*t modulo 2^16. Here that is done explicitly with
  // uint16_t wraparound, then converted back to int16_t. The conversion uses the same truncation
  // semantics. The quotient t uses the same rounding and arithmetic shift as the reference.
  int32_t t = ((int32_t)a * 20159 + 33554432) >> 26;
  uint16_t r = (uint16_t)((uint16_t)a - (uint16_t)(t * 3329));
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
