#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_7(int16_t x)
{
  // Returns 0 if x >= 0, else -1.
  // Computes sign bit as 1 if negative, 0 otherwise, then negates.
  int sign = (x >> 15) & 1;
  return -sign;
}


int main(){
    int16_t_negative_mask_7(0);
}
