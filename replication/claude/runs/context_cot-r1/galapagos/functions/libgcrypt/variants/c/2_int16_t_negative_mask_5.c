#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: test bit 15 of the uint16_t bit pattern with a mask.
  // (uint16_t)x & 0x8000 is nonzero exactly when x is negative.
  // The != 0 test gives 1 or 0, and negating it gives -1 or 0.
  // This is the same as the reference's u >> 15 followed by negation.
  return -(int)(((uint16_t)x & 0x8000u) != 0);
}


int main(){
    int16_t_negative_mask(0);
}
