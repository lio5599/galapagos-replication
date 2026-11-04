#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = (uint16_t) x;
  int bit = (u >> 8) >> 7;
  return bit ? -1 : 0;
}


int main(){
    int16_t_negative_mask(0);
}
