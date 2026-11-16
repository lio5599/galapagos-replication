#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_10 (int16_t x)
{
  uint16_t u = (uint16_t)x;
  int mask = (int)(u >> 15);
  return mask - (mask << 1);
}


int main(){
    int16_t_negative_mask_10(0);
}
