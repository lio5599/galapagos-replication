#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int64_t product = (int64_t)a * 20159;
  int64_t quotient = (product + 33554432) >> 26;
  int64_t result = (int64_t)a - quotient * 3329;
  return (int16_t)result;
}


int main(){
    barrett_reduce(0);
}
