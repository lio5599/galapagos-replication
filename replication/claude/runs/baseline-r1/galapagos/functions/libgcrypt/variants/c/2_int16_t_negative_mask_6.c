#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  int r = 0;
  if (x < 0)
    r = -1;
  return r;
}


int main(){
    int16_t_negative_mask(0);
}
