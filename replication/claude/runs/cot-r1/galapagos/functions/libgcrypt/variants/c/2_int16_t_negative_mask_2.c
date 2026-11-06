#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: mask the sign bit 0x8000 of the 16-bit unsigned value.
  // Conversion to uint16_t is modular, so the bit is set iff x < 0.
  // A nonzero mask result maps to -1, and a zero result maps to 0.
  // Edge cases: INT16_MIN maps to 0x8000, giving -1. Also -1 maps to 0xFFFF, giving -1.
  uint16_t u = (uint16_t)x;
  return (u & 0x8000u) ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
