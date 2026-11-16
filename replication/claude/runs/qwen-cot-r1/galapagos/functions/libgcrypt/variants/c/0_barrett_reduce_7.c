#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Alternative 7: Compute v using double and cast, but result is same.
  // This is stylistic; the value 3057 is deterministic.
  // The core Barrett reduction logic remains unchanged.
  // Edge cases handled identically due to same formula.
  int16_t t;
  const int16_t v = (int16_t)((double)(1<<26) / 3329 + 0.5);

  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
