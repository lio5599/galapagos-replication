#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Select the required mask directly according to the sign of x.
  // Zero selects 0, and every negative value, including -32768, selects -1.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
