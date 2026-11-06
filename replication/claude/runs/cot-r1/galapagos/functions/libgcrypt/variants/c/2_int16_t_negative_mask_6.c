#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: compare the unsigned 16-bit image of x against 0x8000.
  // Negative x maps to the range 0x8000..0xFFFF, and non-negative x to 0..0x7FFF.
  // The comparison gives 1 or 0, and multiplying by -1 gives -1 or 0.
  // Edge cases: INT16_MIN maps to 0x8000, so the comparison is true and the result is -1.
  uint16_t u = (uint16_t)x;
  return (int)(u >= 0x8000u) * -1;
}


int main(){
    int16_t_negative_mask(0);
}
