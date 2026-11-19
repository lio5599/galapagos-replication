#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // After unsigned conversion, bit 15 is set exactly for negatives.
  // Testing that bit produces 0 or 1, which is safely negated.
  // Zero and both signed endpoints retain their expected results.
  uint16_t u = x;
  return -((u & 32768u) != 0);
}


int main(){
    int16_t_negative_mask(0);
}
