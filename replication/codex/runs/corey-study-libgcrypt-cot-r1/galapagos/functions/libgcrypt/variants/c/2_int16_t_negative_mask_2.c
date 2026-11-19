#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // The comparison yields 1 for nonnegative x and 0 for negative x.
  // Subtracting 1 maps these to 0 and -1, respectively.
  // This also handles zero and both representable extremes.
  return (x >= 0) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
