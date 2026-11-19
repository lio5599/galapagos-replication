#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Select the result directly according to the sign of x.
  // Zero and positive values return 0; all negative values return -1.
  // No arithmetic on x can overflow, including at its minimum value.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
