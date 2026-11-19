#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Unsigned conversion preserves the reference's sign bit.
  // Flipping bit 15 and shifting gives 1 for nonnegative x, else 0.
  // Subtracting 1 yields 0 or -1, safely including both endpoints.
  uint16_t u = x;
  return (int)((u ^ 32768u) >> 15) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
