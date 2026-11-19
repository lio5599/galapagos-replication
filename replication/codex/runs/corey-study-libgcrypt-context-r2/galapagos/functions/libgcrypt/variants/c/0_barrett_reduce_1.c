#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t x = a;
  int32_t product = 20160 * x - x;
  int16_t t = (product + 33554432) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
