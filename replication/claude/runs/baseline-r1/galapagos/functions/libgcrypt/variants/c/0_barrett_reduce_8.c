#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  const int32_t q = 3329;
  const int32_t v = 20159;
  int32_t prod = v * (int32_t)a;
  int32_t t = (prod + (1 << 25)) >> 26;
  int32_t tq = t * 2048 + t * 1024 + t * 256 + t;
  return (int16_t)((int32_t)a - tq);
}


int main(){
    barrett_reduce(0);
}
