#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: multiply the 0 or 1 result of x < 0 by -1.
  // A negative x gives 1 * -1 = -1, and a non-negative x gives 0 * -1 = 0.
  // This matches the reference, whose u >> 15 is 1 iff x < 0.
  // There is no overflow, because the operands are tiny.
  return (x < 0) * -1;
}


int main(){
    int16_t_negative_mask(0);
}
