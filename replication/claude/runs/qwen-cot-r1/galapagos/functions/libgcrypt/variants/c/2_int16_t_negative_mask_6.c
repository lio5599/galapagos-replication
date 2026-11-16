#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_7(int16_t x)
{
  // Arithmetic right shift propagates sign bit.
  // For int16_t, x >> 15 is -1 if x < 0, else 0.
  // Cast to int to match return type.
  int result = x >> 15;
  return result;
}


int main(){
    int16_t_negative_mask_7(0);
}
