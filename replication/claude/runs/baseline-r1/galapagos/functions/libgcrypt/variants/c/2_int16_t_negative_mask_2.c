#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = (uint16_t) x;
  return -(int) ((u & 0x8000u) != 0);
}


int main(){
    int16_t_negative_mask(0);
}
