#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t r = (int32_t)a % 3329;
  if (r > 1664)
    r -= 3329;
  else if (r < -1664)
    r += 3329;
  return (int16_t)r;
}


int main(){
    barrett_reduce(0);
}
