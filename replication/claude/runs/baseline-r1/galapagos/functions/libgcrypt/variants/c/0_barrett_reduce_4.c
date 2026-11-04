#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int64_t t = ((int64_t)20159 * a + ((int64_t)1 << 25)) >> 26;
  int64_t r = (int64_t)a - t * 3329;
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
