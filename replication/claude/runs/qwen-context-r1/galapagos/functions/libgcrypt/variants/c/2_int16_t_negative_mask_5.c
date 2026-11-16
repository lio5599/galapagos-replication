#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_6 (int16_t x)
{
  uint16_t u = (uint16_t)x;
  int mask = (int)(u >> 15);
  return mask ? -1 : 0;
}


int main(){
    int16_t_negative_mask_6(0);
}
