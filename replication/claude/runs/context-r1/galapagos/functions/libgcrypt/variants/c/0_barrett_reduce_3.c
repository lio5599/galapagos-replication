#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t wide = a;
  int32_t quotient = (wide * 20159 + (1 << 25)) >> 26;
  int32_t multiple = quotient * 4096 - quotient * 768 + quotient;
  return (int16_t)(wide - multiple);
}


int main(){
    barrett_reduce(0);
}
