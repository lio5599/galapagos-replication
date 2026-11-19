#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Round the quotient to the nearest integer using a sign-dependent offset.
  // Division truncates toward zero; odd modulus 3329 prevents halfway ties.
  // All intermediates fit int32_t, including those for both int16_t endpoints.
  int32_t x = a;
  int32_t q = (x + (x >= 0 ? 1664 : -1664)) / 3329;
  return (int16_t)(x - q * 3329);
}


int main(){
    barrett_reduce(0);
}
