#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = x;
  unsigned int w = u;
  return (int) (0u - (w >> 15));
}


int main(){
    int16_t_negative_mask(0);
}
