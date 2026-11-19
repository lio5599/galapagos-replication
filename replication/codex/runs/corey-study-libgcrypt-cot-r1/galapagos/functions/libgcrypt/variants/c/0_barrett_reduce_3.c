#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Signed division with a sign-dependent bias finds the nearest quotient.
  // An odd modulus has no integer halfway cases, including at the boundaries.
  // All biased inputs and quotient products fit int32_t for every int16_t.
  int32_t x = (int32_t)a;
  int32_t q = x >= 0 ? (x + 1664) / 3329 : (x - 1664) / 3329;
  return (int16_t)(x - q * 3329);
}


int main(){
    barrett_reduce(0);
}
