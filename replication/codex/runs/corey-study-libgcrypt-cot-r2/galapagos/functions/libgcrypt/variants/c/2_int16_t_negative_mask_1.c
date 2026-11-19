#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Select the mask directly according to the sign of x.
  // All negative values, including -32768, yield -1.
  // Zero and all positive values yield 0.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
