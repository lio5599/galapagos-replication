#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask (int16_t x)
{
  // The reference returns -1 for negative x and 0 otherwise.
  // The comparison yields 1 exactly when x is negative.
  // Negation gives the required result, including zero and both extremes.
  return -(x < 0);
}


int main(){
    int16_t_negative_mask(0);
}
