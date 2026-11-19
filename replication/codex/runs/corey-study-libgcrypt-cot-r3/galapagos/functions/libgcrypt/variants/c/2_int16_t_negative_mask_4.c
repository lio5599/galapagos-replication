#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Conversion maps negative inputs to 32768 through 65535.
  // Nonnegative inputs remain 0 through 32767, so the test identifies sign.
  // Negating its Boolean result handles zero and both endpoints exactly.
  return -((uint16_t)x > 32767u);
}


int main(){
    int16_t_negative_mask(0);
}
