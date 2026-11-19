#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // XOR inverts all 16 bits of the converted value.
  // The shifted result is 1 for nonnegative x and 0 for negative x.
  // Subtracting 1 gives the required mask, including zero and endpoints.
  uint16_t u = (uint16_t)x ^ 0xffffu;
  return (int)(u >> 15) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
