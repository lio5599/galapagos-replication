#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: the comparison x < 0 yields an int that is 1 or 0.
  // Negating it gives -1 for negative x and 0 otherwise.
  // This matches the reference, whose u >> 15 is 1 exactly when x < 0.
  // There is no overflow, because only 0 or 1 is negated.
  return -(x < 0);
}


int main(){
    int16_t_negative_mask(0);
}
