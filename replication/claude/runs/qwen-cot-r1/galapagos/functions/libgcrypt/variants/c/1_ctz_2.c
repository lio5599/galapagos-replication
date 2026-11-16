#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Counts trailing zeros using de Bruijn-like approach with multiplication
 // Multiply by magic number to spread LSB position to high bits
 // Use lookup table indexed by high bits to get count directly
 // Handles in==0 as special case returning 64
 static const int mul_debruijn[64] = {
  0, 1, 2, 53, 3, 7, 54, 27, 4, 38, 41, 8, 34, 55, 48, 28,
  62, 5, 39, 46, 44, 42, 22, 9, 24, 35, 59, 56, 49, 18, 29, 11,
  63, 52, 6, 26, 37, 40, 33, 47, 61, 45, 43, 21, 23, 58, 17, 10,
  51, 25, 36, 32, 60, 20, 57, 16, 50, 31, 19, 15, 14, 13, 12, 0
 };
 if (in == 0)
  return 64;
 return mul_debruijn[((uint64_t)(in & -in) * 0x022FDD63CC95386DULL) >> 58];
}


int main(){
    ctz(0);
}
