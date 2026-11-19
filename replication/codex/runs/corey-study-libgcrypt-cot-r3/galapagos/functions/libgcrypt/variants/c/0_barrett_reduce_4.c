#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Reduce the magnitude, center it, and restore the original sign.
  // Centered reduction is odd because the odd modulus permits no halfway tie.
  // Thus this gives the same centered residue as the reference.
  // Widening before negation safely handles a equal to -32768.
  int32_t x = a;
  int32_t magnitude = x < 0 ? -x : x;
  int32_t r = magnitude % 3329;
  if (r > 1664)
    r -= 3329;
  return (int16_t)(x < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
