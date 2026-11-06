#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Reference: Barrett reduction, returns a - 3329*round(a*20159/2^26), a centered rep of a mod 3329.
  // v = (2^26 + 1664)/3329 = 20159. The product 20159*a + 2^25 fits in int32 for all int16 a.
  // >> 26 on int32 is an arithmetic shift, i.e. floor division, as in the reference.
  // |t| <= 10, and the true value a - 3329*t is in int16 range, so computing in int32
  // and truncating to int16 gives the same result as the reference's 16-bit wraparound.
  int32_t t = (20159 * (int32_t)a + 33554432) >> 26;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
