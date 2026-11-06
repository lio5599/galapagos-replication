#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: use explicit branching on the sign of x.
  // Negative values return -1 and all other values return 0.
  // This is identical to the reference, whose sign bit is set iff x < 0.
  // Edge cases: INT16_MIN returns -1, and 0 returns 0 because 0 is not negative.
  if (x < 0)
    return -1;
  return 0;
}


int main(){
    int16_t_negative_mask(0);
}
