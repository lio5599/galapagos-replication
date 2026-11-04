#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  if (x < 0) {
    return -1;
  }
  return 0;
}


int main(){
    int16_t_negative_mask(0);
}
