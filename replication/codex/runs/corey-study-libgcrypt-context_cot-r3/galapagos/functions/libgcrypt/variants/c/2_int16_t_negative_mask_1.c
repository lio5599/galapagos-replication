#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Select the reference's result directly from the sign of x.
  // Zero and all positive values return 0; all negative values return -1.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
