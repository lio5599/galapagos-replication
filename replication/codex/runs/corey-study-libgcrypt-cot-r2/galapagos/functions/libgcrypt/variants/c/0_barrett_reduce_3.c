#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Reduce the magnitude to a centered residue, then restore the input's sign.
  // Centered reduction is odd because the odd modulus allows no halfway ties.
  // Widening before negation safely handles -32768 and every other input.
  int32_t x = a;
  int32_t magnitude = x < 0 ? -x : x;
  int32_t r = (magnitude + 1664) % 3329 - 1664;
  return (int16_t)(x < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
