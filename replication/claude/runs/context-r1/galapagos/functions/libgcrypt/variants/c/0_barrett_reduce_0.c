#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  return (int16_t)((int32_t)a - (((int32_t)20159 * a + 33554432) >> 26) * 3329);
}


int main(){
    barrett_reduce(0);
}
