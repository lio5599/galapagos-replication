#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Efficient modulo 3329 using Barrett reduction technique
  // v = floor((2^26 + 3329/2) / 3329) is the magic constant for this modulus
  // Multiplication by v followed by shift approximates division by 3329
  // The bias 2^25 ensures the quotient is correctly rounded
  // Subtracting the product of quotient and modulus gives the remainder
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
