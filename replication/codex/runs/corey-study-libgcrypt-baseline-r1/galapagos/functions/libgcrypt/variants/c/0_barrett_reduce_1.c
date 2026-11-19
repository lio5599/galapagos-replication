#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int64_t t = ((int64_t)a * 20159 + 33554432) >> 26;
  return (int16_t)((int64_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
