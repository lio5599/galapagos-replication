#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // The comparison is 1 for nonnegative inputs and 0 for negative inputs.
  // Subtracting 1 therefore gives 0 or -1, including at both endpoints.
  return (x >= 0) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
