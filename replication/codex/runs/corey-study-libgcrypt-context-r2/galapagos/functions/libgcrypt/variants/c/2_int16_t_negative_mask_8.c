#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  unsigned long u = (uint16_t)x;
  return -(int)((u * 2UL) >> 16);
}


int main(){
    int16_t_negative_mask(0);
}
