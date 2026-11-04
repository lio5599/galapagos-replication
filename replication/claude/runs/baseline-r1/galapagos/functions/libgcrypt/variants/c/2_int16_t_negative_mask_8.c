#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  int32_t v = (int32_t) x;
  return -(int) ((uint32_t) v >> 31);
}


int main(){
    int16_t_negative_mask(0);
}
