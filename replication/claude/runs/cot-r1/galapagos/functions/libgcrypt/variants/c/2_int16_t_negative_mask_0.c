#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Reference: returns -1 (all bits set) if x is negative, otherwise 0.
  // Approach: compare x with zero directly and select -1 or 0.
  // Converting x to uint16_t and shifting by 15 isolates the sign bit,
  // which is 1 exactly when x < 0. So the reference yields -1 for negative x.
  // Edge cases: INT16_MIN gives -1, while 0 and INT16_MAX give 0.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
