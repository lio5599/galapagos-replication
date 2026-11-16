#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_1(int16_t x)
{
  // Returns 0 if x >= 0, else -1.
  // Shifts sign bit to LSB, then negates to get 0 or -1.
  uint16_t u = (uint16_t)x;
  u >>= 15;
  return -(int)u;
}


int main(){
    int16_t_negative_mask_1(0);
}
