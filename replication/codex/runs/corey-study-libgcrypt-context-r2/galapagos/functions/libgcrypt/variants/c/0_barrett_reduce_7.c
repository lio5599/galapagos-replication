#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t numerator = (int32_t)20159 * a + 1107296256;
  int16_t t = (numerator >> 26) - 16;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
