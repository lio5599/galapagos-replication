#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Converted negative inputs exceed 32767; other inputs do not.
  // Negate this unsigned-range test to obtain -1 or 0.
  // The boundary inputs -32768, -1, 0, and 32767 follow the same rule.
  uint16_t u = x;
  return -(int)(u > 32767u);
}


int main(){
    int16_t_negative_mask(0);
}
