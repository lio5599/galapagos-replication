#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // As in the reference, shifting the unsigned value extracts bit 15.
  // Its value is 1 for negatives and 0 for nonnegatives.
  // Multiplication by -1 is safe for both values, including edge inputs.
  uint16_t u = x;
  return (int)(u >> 15) * -1;
}


int main(){
    int16_t_negative_mask(0);
}
