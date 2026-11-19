#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  return (int16_t)(((int32_t)a + 34954) % 3329 - 1664);
}


int main(){
    barrett_reduce(0);
}
