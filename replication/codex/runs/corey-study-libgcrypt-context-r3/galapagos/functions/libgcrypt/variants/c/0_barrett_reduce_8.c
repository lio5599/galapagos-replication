#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int64_t n = (int64_t)a * 20159 + 33554432;
  int16_t t = n >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
