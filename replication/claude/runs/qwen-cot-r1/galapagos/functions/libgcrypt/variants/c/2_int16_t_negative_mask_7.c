#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_8(int16_t x)
{
  // Use bitwise NOT on zero-extended sign bit.
  // Shift right 15 to get 0 or 1, then compute ~0 & mask.
  // If bit is 1, ~0 is -1; if 0, result is 0.
  uint16_t u = (uint16_t) x;
  int bit = (u >> 15) & 1;
  return -bit;
}


int main(){
    int16_t_negative_mask_8(0);
}
