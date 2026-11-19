#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Replace arithmetic right shift with explicit floor division.
  // Correct truncation toward zero when the biased value is negative.
  // Negation and the correction fit in int32_t for every input.
  // Preserve both int16_t conversions from the reference.
  int32_t biased = (int32_t)20159 * a + 33554432;
  int32_t quotient;
  if (biased < 0)
    quotient = -((-biased + 67108863) / 67108864);
  else
    quotient = biased / 67108864;
  int16_t t = quotient;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
