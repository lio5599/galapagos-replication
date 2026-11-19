#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Unsigned conversion places negative inputs at or above 32768.
  // Adding 32768 then shifting by 16 detects precisely that range.
  // Unsigned long holds the maximum sum 98303 without overflow.
  // Negating the resulting 0 or 1 handles zero and both endpoints.
  unsigned long u = (uint16_t)x;
  return -(int)((u + 32768UL) >> 16);
}


int main(){
    int16_t_negative_mask(0);
}
