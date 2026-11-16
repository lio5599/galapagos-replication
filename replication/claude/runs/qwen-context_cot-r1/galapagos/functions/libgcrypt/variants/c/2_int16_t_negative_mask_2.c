#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_3(int16_t x)
{
  // Returns 0 if x >= 0, else -1.
  // Checks if x is negative and returns -1 or 0 accordingly.
  if (x < 0)
    return -1;
  return 0;
}


int main(){
    int16_t_negative_mask_3(0);
}
