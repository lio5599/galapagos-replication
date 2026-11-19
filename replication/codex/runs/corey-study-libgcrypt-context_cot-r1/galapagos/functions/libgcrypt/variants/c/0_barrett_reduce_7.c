#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Calculates the same quotient but expands 3329 as 3328 + 1.
  // The expanded product fits int32_t before its int16_t narrowing.
  // Preserving that narrowing also handles the extreme quotient values.
  int16_t t = ((int32_t)20159 * a + 33554432) >> 26;
  int32_t multiple = (int32_t)t * 3328 + t;
  t = (int16_t)multiple;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
