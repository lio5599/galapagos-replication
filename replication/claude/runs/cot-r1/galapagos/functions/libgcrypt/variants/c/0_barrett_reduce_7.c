#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Computes the Barrett quotient t as in the reference, then applies it by repeated steps.
  // Subtracting 3329 t times (or adding |t| times when t < 0) gives a - 3329*t.
  // |t| <= 10 and the running value stays within int32, so it is exact.
  // The final value fits in int16, matching the reference's wrapped arithmetic.
  int32_t t = ((int32_t)20159 * a + 33554432) >> 26;
  int32_t r = a;
  while (t > 0) { r -= 3329; t--; }
  while (t < 0) { r += 3329; t++; }
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
