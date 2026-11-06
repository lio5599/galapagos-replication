#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // 20159*a is split as 20000*a + 159*a. Each term and the sum fit in int32, so the value is the same.
  // The rounding constant 2^25 and the arithmetic shift by 26 reproduce the reference quotient.
  // The exact remainder a - 3329*t fits in int16, so truncation gives the same output.
  int32_t ai = a;
  int32_t t = (ai * 20000 + ai * 159 + 33554432) >> 26;
  return (int16_t)(ai - t * 3329);
}


int main(){
    barrett_reduce(0);
}
