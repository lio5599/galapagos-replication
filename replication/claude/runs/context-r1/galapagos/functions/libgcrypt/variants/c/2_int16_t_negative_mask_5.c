#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = x;
  unsigned int masked = u & 0x8000u;
  masked >>= 15;
  return -(int) masked;
}


int main(){
    int16_t_negative_mask(0);
}
