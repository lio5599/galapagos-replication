#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Widening before adding maps the full input range to 0 through 65535.
  // Division yields 0 for negative x and 1 for nonnegative x.
  // Subtracting 1 gives the mask; all arithmetic fits in long.
  return (int)(((long)x + 32768L) / 32768L) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
