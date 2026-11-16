#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_1 (int16_t x)
{
  return (x < 0) ? -1 : 0;
}


int main(){
    int16_t_negative_mask_1(0);
}
