#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Use the reference's exact reciprocal, 20159, and rounding numerator.
  // Explicit floor division reproduces its arithmetic right shift.
  // Wide arithmetic avoids overflow and narrowing of the intermediate product.
  // The final centered residue fits int16_t even at the input endpoints.
  int64_t n = (int64_t)20159 * a + 33554432;
  int32_t q = n >= 0
      ? (int32_t)(n / 67108864)
      : (int32_t)(-((-n + 67108863) / 67108864));
  return (int16_t)((int32_t)a - q * 3329);
}


int main(){
    barrett_reduce(0);
}
