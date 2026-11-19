#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // After unsigned conversion, bit 15 is set exactly when x is negative.
  // Testing that bit gives 0 or 1, whose negation is the required mask.
  // Zero has that bit clear; -32768 and every other negative have it set.
  return -(((uint16_t)x & 0x8000u) != 0);
}


int main(){
    int16_t_negative_mask(0);
}
