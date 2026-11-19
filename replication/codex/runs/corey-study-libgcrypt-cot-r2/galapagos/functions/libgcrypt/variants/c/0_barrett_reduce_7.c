#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Shift into [2186, 67721], then compute the remainder by binary subtraction.
  // The dividend is below 32 moduli, so these five tests suffice for all inputs.
  // Removing the centering offset gives the reference's unique centered residue.
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
