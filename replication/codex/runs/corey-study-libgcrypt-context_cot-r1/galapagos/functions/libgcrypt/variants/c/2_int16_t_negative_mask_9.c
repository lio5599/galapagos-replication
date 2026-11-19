#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Adding 32768 in long maps the input range to 0 through 65535.
  // Division yields 0 for negatives and 1 for nonnegative inputs.
  // Subtracting 1 gives the mask, with all arithmetic in range.
  return (int)(((long)x + 32768L) / 32768L) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
