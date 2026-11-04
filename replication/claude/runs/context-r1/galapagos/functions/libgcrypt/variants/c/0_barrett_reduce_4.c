#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  const int32_t v = 20159;
  int32_t product = v * (int32_t)a;
  int32_t quotient = ((product >> 25) + 1) >> 1;
  return (int16_t)((int32_t)a - quotient * 3329);
}


int main(){
    barrett_reduce(0);
}
