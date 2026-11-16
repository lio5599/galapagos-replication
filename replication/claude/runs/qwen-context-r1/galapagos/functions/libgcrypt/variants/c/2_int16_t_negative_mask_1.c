#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_2 (int16_t x)
{
  int16_t sign = x >> 15;
  return sign;
}


int main(){
    int16_t_negative_mask_2(0);
}
