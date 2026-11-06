#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: subtract the unsigned image of x from its signed value.
  // For x < 0, (uint16_t)x equals x + 65536, so the difference is -65536.
  // For x >= 0 the two are equal, so the difference is 0.
  // Dividing by 65536 gives exactly -1 or 0, with no rounding issues.
  int d = (int)x - (int)(uint16_t)x;
  return d / 65536;
}


int main(){
    int16_t_negative_mask(0);
}
