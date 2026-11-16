#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_8 (int16_t x)
{
  uint16_t u = (uint16_t)x;
  uint16_t shifted = u >> 15;
  return (int)(shifted * -1);
}


int main(){
    int16_t_negative_mask_8(0);
}
