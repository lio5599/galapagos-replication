#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Branch directly on whether x is negative.
  // Every negative value, including the minimum, returns -1.
  // Zero and every positive value return 0 without any arithmetic on x.
  if (x < 0)
    return -1;
  return 0;
}


int main(){
    int16_t_negative_mask(0);
}
