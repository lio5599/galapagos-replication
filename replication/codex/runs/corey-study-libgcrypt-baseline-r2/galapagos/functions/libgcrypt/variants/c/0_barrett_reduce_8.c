#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t q = ((int32_t)a + 34954) / 3329 - 10;
  return (int16_t)((int32_t)a - q * 3329);
}


int main(){
    barrett_reduce(0);
}
