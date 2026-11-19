#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Toggle bit 15 before extracting it, producing the inverse sign bit.
  // Subtracting 1 maps negative inputs to -1 and nonnegative inputs to 0.
  // Conversion and extraction remain valid at both endpoints and zero.
  uint16_t u = x;
  return (int)((u ^ 0x8000u) >> 15) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
