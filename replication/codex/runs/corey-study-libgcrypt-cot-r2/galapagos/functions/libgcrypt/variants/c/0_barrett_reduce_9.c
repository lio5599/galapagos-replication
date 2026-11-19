#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Binary-search the greatest quotient whose centered interval starts at or below a.
  // Quotients from -10 through 10 cover the entire int16_t input range.
  // The interval boundaries are q*3329-1664 and q*3329+1664.
  // Thus the final subtraction matches the reference, including all boundaries.
  int32_t x = a;
  int32_t lo = -10;
  int32_t hi = 10;
  while (lo < hi) {
    int32_t mid = lo + (hi - lo + 1) / 2;
    if (x >= mid * 3329 - 1664)
      lo = mid;
    else
      hi = mid - 1;
  }
  return (int16_t)(x - lo * 3329);
}


int main(){
    barrett_reduce(0);
}
