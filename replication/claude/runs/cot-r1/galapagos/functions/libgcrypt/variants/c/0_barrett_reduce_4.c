#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Finds t = floor(x / 2^26) by linear search, where x = 20159*a + 2^25.
  // x lies in [-627015680, 694104385], so t is in [-10, 10]; the search starts at -11.
  // t is incremented while (t+1)*2^26 <= x, so it stops at the largest t with t*2^26 <= x.
  // That is exactly the floor the reference's arithmetic shift produces, and the result follows.
  int32_t x = (int32_t)20159 * a + 33554432;
  int32_t t = -11;
  while ((int32_t)(t + 1) * 67108864 <= x)
    t++;
  return (int16_t)(a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
