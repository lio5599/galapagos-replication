#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Compute t as in the reference. Then multiply by 3329 as 4096 - 512 - 256 + 1 using
  // multiplications rather than left shifts, which avoids UB on negative t.
  // The sum equals 3329*t exactly. The int32 remainder fits in int16, so truncation matches.
  int32_t t = ((int32_t)a * 20159 + (1 << 25)) >> 26;
  int32_t m = t * 4096 - t * 512 - t * 256 + t;
  return (int16_t)((int32_t)a - m);
}


int main(){
    barrett_reduce(0);
}
