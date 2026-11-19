#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Binary-sized modulus subtractions reduce the magnitude without division.
  // Every magnitude is below sixteen moduli, so four tests leave it below 3329.
  // Centering and restoring the sign give the same residue, even for -32768.
  int32_t x = (int32_t)a;
  int32_t r = x < 0 ? -x : x;
  if (r >= 26632)
    r -= 26632;
  if (r >= 13316)
    r -= 13316;
  if (r >= 6658)
    r -= 6658;
  if (r >= 3329)
    r -= 3329;
  if (r > 1664)
    r -= 3329;
  return (int16_t)(x < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
