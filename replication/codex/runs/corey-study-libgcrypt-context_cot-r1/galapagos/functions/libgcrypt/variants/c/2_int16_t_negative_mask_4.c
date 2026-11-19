#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // The converted value has bit 15 set exactly when x is negative.
  // Testing that bit and negating yields the required mask.
  // This includes both endpoints and leaves zero mapped to 0.
  return -(int)(((uint16_t)x & 0x8000u) != 0);
}


int main(){
    int16_t_negative_mask(0);
}
