#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Conversion to uint16_t maps negatives into 32768 through 65535.
  // Division by 32768 therefore yields the reference's sign bit.
  // Negating that 0 or 1 is safe, including at both endpoints.
  uint16_t u = x;
  return -(int)(u / 32768u);
}


int main(){
    int16_t_negative_mask(0);
}
