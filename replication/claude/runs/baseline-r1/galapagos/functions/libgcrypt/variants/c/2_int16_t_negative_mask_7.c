#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = (uint16_t) x;
  return (int) (0u - (unsigned int) (u >= 0x8000u));
}


int main(){
    int16_t_negative_mask(0);
}
