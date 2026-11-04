#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  int v = x;
  return v >> 31;
}


int main(){
    int16_t_negative_mask(0);
}
