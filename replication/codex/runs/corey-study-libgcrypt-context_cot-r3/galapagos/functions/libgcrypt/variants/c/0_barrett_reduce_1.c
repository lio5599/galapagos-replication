#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Replace multiplication by 20159 with multiplication by 20160 minus a.
  // Both the intermediate product and rounded numerator fit in int32_t.
  // The quotient and subsequent int16_t conversions remain unchanged.
  int16_t t;
  int32_t x = (int32_t)20160 * a - a;
  t = (x + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
