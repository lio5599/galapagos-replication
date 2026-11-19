#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t numerator = (int32_t)20159 * a + 33554432;
  int32_t intermediate = numerator >> 13;
  int16_t t = intermediate >> 13;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
