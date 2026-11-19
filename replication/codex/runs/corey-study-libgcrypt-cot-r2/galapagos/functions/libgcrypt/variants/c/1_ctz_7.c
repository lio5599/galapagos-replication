#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Skip zero nibbles, then classify the first nonzero nibble.
 // Its lowest set bit adds zero through three to the skipped count.
 // Zero is handled separately so the skipping loop always terminates.
 int r = 0;
 if (in == 0)
  return 64;
 while ((in & UINT64_C(15)) == 0)
 {
  r += 4;
  in >>= 4;
 }
 switch ((unsigned int)(in & UINT64_C(15)))
 {
  case 8:
   return r + 3;
  case 4:
  case 12:
   return r + 2;
  case 2:
  case 6:
  case 10:
  case 14:
   return r + 1;
  default:
   return r;
 }
}


int main(){
    ctz(0);
}
