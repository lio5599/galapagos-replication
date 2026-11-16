#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_3 (int16_t x)
{
  uint16_t u = (uint16_t)x;
  uint16_t mask = u >> 15;
  return (int)(mask - 1);
}


int main(){
    int16_t_negative_mask_3(0);
}
