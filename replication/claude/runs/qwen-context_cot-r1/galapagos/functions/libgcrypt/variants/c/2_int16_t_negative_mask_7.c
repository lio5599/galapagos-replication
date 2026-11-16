#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_8(int16_t x)
{
  // Returns 0 if x >= 0, else -1.
  // Uses unsigned shift to isolate sign bit, then conditionally returns.
  uint16_t u = (uint16_t)x;
  int sign = (u >> 15) & 1;
  return sign ? -1 : 0;
}


int main(){
    int16_t_negative_mask_8(0);
}
