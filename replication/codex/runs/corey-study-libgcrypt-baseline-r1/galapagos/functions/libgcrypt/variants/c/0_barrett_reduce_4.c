#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t x = a;
  int32_t product = x * 20480 - x * 320 - x;
  int32_t t = (product + 33554432) >> 26;
  return (int16_t)(x - t * 3329);
}


int main(){
    barrett_reduce(0);
}
