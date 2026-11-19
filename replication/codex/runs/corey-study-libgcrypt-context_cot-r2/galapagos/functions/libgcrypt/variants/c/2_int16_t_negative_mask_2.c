#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Branch on the sign without performing arithmetic on x.
  // Nonnegative inputs return 0; every negative input returns -1.
  // Both endpoints and zero are handled by the same sign test.
  if (x >= 0)
    return 0;
  return -1;
}


int main(){
    int16_t_negative_mask(0);
}
