#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  uint16_t u = x;
  return (int)((65535u - u) / 32768u) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
