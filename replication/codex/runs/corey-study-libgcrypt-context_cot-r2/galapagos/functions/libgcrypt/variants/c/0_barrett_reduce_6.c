#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // With arithmetic right shifts, extract the quotient in two stages.
  // Floor of half of floor of x divided by 2^25 plus one equals
  // floor of x plus 2^25 divided by 2^26, including negative ties.
  // All intermediates fit; retain the original int16_t conversions.
  int32_t product = (int32_t)20159 * a;
  int32_t coarse = product >> 25;
  int16_t t = (coarse + 1) >> 1;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
