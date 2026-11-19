#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t n = (int32_t)a * 20159 + 33554432;
  int32_t t;

  if (n >= 0)
    t = n / 67108864;
  else
    t = -1 - (-(n + 1) / 67108864);

  return (int16_t)((int32_t)a - t * 3329);
}


int main(){
    barrett_reduce(0);
}
