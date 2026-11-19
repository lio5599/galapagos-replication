#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t magnitude = a < 0 ? -(int32_t)a : (int32_t)a;
  int32_t q = (magnitude + 1664) / 3329;
  if (a < 0)
    q = -q;
  return (int16_t)((int32_t)a - q * 3329);
}


int main(){
    barrett_reduce(0);
}
