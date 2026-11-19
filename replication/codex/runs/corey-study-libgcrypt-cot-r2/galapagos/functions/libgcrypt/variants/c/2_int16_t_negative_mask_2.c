#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Branch on whether x is nonnegative.
  // Zero and 32767 return 0; every negative value returns -1.
  // No arithmetic on x is needed, so -32768 is safe.
  if (x >= 0)
    return 0;
  return -1;
}


int main(){
    int16_t_negative_mask(0);
}
