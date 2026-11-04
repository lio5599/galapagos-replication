#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint32_t u = (uint32_t) (uint16_t) x;
  return -(int) ((u >> 15) & 1u);
}


int main(){
    int16_t_negative_mask(0);
}
