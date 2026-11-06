#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: start with a result of 0 and set it to -1 if the unsigned image exceeds 0x7FFF.
  // An unsigned value above 0x7FFF means the sign bit is set, which happens iff x < 0.
  // So the result is -1 for negative x and 0 otherwise, as in the reference.
  // Edge cases: INT16_MAX maps to 0x7FFF, which is not greater, so the result is 0.
  int r = 0;
  if ((uint16_t)x > 0x7FFFu)
    r = -1;
  return r;
}


int main(){
    int16_t_negative_mask(0);
}
