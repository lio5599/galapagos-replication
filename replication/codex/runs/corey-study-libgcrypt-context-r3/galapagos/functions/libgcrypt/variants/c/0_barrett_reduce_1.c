#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  const int16_t v = ((1 << 26) + 3329 / 2) / 3329;
  int32_t n = (int32_t)a * v;
  n += 33554432;
  int16_t t = n >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
