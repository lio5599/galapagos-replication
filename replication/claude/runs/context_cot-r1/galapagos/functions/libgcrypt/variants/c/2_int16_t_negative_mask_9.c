#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Approach: x >= 0 yields 1 or 0, and subtracting 1 gives 0 or -1.
  // A non-negative x gives 1 - 1 = 0, and a negative x gives 0 - 1 = -1.
  // This matches the reference exactly, including x = 0 and x = -32768.
  // The arithmetic is plain int subtraction with no overflow.
  return (x >= 0) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
