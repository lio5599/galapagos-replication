#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  uint32_t x = (uint32_t)((int32_t)a * 20159 + 704643072);
  int32_t t = (int32_t)(x >> 26) - 10;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
