#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t magnitude = a < 0 ? -(int32_t)a : (int32_t)a;
  int32_t r = magnitude % 3329;
  if (r > 1664)
    r -= 3329;
  return (int16_t)(a < 0 ? -r : r);
}


int main(){
    barrett_reduce(0);
}
