#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t q = (int32_t)a / 3329;
  int32_t r = (int32_t)a - q * 3329;
  r -= (r > 1664) * 3329;
  r += (r < -1664) * 3329;
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
