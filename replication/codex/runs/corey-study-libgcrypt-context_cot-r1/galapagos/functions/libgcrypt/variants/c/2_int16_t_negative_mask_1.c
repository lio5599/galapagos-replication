#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Select the mask directly from the sign comparison.
  // All negative inputs select -1; zero and positives select 0.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
