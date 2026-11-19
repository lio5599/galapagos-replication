#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // First extract the unsigned high byte, whose range is 0 through 255.
  // Dividing by 128 extracts bit 15 of the original representation.
  // Negation matches the reference for every input, including endpoints.
  uint16_t u = x;
  int high_byte = (int)(u >> 8);
  return -(high_byte / 128);
}


int main(){
    int16_t_negative_mask(0);
}
