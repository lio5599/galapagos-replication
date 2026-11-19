#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Add ten moduli and 1664 to make the dividend strictly positive.
  // Its remainder minus 1664 is congruent to a and lies in the centered range.
  // Uniqueness of that representative establishes equality to the reference.
  // The biased dividend ranges from 2186 to 67721, so endpoints are safe.
  int32_t x = (int32_t)a + 34954;
  return (int16_t)(x % 3329 - 1664);
}


int main(){
    barrett_reduce(0);
}
