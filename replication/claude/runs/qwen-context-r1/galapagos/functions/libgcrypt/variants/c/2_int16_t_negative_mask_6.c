#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_7 (int16_t x)
{
  int sign_bit = (x < 0) ? 1 : 0;
  return -sign_bit;
}


int main(){
    int16_t_negative_mask_7(0);
}
