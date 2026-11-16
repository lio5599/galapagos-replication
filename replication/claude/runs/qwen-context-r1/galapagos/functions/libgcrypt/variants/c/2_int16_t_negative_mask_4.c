#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_5 (int16_t x)
{
  int sign = (x >> 15) & 1;
  return -sign;
}


int main(){
    int16_t_negative_mask_5(0);
}
