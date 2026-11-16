#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_9 (int16_t x)
{
  int result = 0;
  if (x < 0) {
    result = -1;
  }
  return result;
}


int main(){
    int16_t_negative_mask_9(0);
}
