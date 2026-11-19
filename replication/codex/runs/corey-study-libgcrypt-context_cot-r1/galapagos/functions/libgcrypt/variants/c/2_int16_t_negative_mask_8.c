#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Logical negation of the sign-bit mask is 1 for nonnegative inputs.
  // Subtracting 1 gives 0 for those inputs and -1 for negative inputs.
  // Zero and both int16_t endpoints are covered without overflow.
  uint16_t u = x;
  return (int)!(u & 0x8000u) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
