#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Nonnegativity yields 1 for zero or positive x and 0 for negative x.
  // Subtracting 1 therefore gives exactly 0 or -1, without overflow.
  return (x >= 0) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
