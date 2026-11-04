#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  uint32_t n = (uint32_t)((int32_t)20159 * (int32_t)a + (1 << 25)) + (16u << 26);
  int32_t t = (int32_t)(n >> 26) - 16;
  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
