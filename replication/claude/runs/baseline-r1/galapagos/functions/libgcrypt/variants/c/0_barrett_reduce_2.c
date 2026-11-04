#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t x = (int32_t)20159 * (int32_t)a;
  int32_t t = ((x >> 25) + 1) >> 1;
  int32_t r = (int32_t)a - (t * 3328 + t);
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
