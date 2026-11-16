#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_4(int16_t x)
{
  // Returns 0 if x >= 0, else -1.
  // Uses ternary operator based on sign check.
  return x < 0 ? -1 : 0;
}


int main(){
    int16_t_negative_mask_4(0);
}
