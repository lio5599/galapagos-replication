#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t x = a;
  int32_t q = x / 3329;
  int32_t r = x - q * 3329;
  r -= (int32_t)(r > 1664) * 3329;
  r += (int32_t)(r < -1664) * 3329;
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
