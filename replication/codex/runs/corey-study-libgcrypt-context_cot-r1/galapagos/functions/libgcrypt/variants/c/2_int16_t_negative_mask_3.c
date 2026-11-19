#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // Conversion maps negatives to 32768 through 65535.
  // Unsigned division by 32768 therefore yields their sign bit.
  // Negation gives -1 for negatives and 0 for zero and positives.
  uint16_t u = x;
  return -(int)(u / 32768u);
}


int main(){
    int16_t_negative_mask(0);
}
