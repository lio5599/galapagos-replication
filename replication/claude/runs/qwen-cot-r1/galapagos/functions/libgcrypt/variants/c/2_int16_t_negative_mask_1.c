#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask_2(int16_t x)
{
  // Direct conditional: if x < 0 return -1, else 0.
  // Equivalent because the mask is -1 for negative, 0 otherwise.
  if (x < 0)
    return -1;
  return 0;
}


int main(){
    int16_t_negative_mask_2(0);
}
