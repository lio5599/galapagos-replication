#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Subtracting the unsigned representation from 65535 flips its 16 bits.
  // The resulting high bit is 1 for nonnegative x and 0 for negative x.
  // Subtracting 1 maps those cases to 0 and -1, including both endpoints.
  uint16_t u = x;
  uint16_t inverted = 65535u - u;
  return (int)(inverted >> 15) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
