#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Unsigned conversion places negatives above 32767.
  // Nonnegative values remain at or below 32767, including zero.
  // Negating the comparison therefore works across the entire range.
  uint16_t u = x;
  return -(u > 32767u);
}


int main(){
    int16_t_negative_mask(0);
}
