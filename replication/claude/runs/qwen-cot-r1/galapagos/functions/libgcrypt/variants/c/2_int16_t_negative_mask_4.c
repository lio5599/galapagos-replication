#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_5(int16_t x)
{
  // Use unsigned conversion and shift to isolate sign bit.
  // Convert to uint16_t, shift right 15 to get 0 or 1.
  // Subtract 1 then negate: 0->-1->1? No.
  // Better: if bit is 1, return -1; if 0, return 0.
  uint16_t u = (uint16_t) x;
  int bit = (u >> 15) & 1;
  return -bit;
}


int main(){
    int16_t_negative_mask_5(0);
}
