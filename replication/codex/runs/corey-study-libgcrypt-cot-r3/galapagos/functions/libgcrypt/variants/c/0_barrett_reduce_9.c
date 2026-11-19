#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Apply the rounded reciprocal to the magnitude and restore the result's sign.
  // Since 20159 * 3329 equals 67108864 + 447, quotient error is below 0.000066.
  // This is below the minimum distance to a rounding tie, 1 / 6658.
  // Thus the quotient is nearest and centered reduction is odd for every input.
  // Widening before negation and multiplication also covers a equal to -32768.
  int32_t x = a;
  int32_t magnitude = x < 0 ? -x : x;
  int32_t q = (20159 * magnitude + 33554432) / 67108864;
  int32_t r = magnitude - q * 3329;
  return (int16_t)(x < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
