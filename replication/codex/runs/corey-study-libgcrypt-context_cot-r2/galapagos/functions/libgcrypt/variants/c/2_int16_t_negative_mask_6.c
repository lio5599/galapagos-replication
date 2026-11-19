#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // The unsigned conversion is below 32768 exactly when x is nonnegative.
  // The comparison yields 1 for that range and 0 for negative inputs.
  // Subtracting 1 handles zero and both endpoints without overflow.
  uint16_t u = x;
  return (u < 32768u) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
