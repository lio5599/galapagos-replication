#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Bias into [2186, 67721], then reduce using descending binary multiples.
  // Each conditional subtraction leaves less than the multiple just tested.
  // The final value is the nonnegative remainder modulo 3329.
  // Subtracting 1664 gives the reference's centered residue, endpoints included.
  int32_t r = (int32_t)a + 34954;
  if (r >= 53264)
    r -= 53264;
  if (r >= 26632)
    r -= 26632;
  if (r >= 13316)
    r -= 13316;
  if (r >= 6658)
    r -= 6658;
  if (r >= 3329)
    r -= 3329;
  return (int16_t)(r - 1664);
}


int main(){
    barrett_reduce(0);
}
