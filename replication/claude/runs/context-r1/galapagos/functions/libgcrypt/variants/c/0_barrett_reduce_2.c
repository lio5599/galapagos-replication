#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t wide = a;
  int32_t product = wide * 20000 + wide * 159;
  int32_t quotient = (product + 33554432) >> 26;
  return (int16_t)(wide - quotient * 3329);
}


int main(){
    barrett_reduce(0);
}
