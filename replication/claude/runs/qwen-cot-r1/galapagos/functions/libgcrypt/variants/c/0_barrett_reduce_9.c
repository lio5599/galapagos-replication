#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Alternative 9: Inline the constant v calculation step by step.
  // 1<<26 is 67108864, plus 1664 is 67110528, divided by 3329 is 3057.
  // Using this derived constant preserves exact behavior.
  // The rest of Barrett reduction is identical to reference.
  int16_t t;
  const int16_t v = 67110528 / 3329;

  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
