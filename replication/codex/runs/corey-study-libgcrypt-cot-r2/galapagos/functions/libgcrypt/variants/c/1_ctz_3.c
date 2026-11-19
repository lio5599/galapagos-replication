#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Skip zero low blocks of decreasing power-of-two sizes.
 // The remaining nonzero value locates the first set bit exactly.
 // Handle zero separately because it has 64 trailing zeros.
 int r = 0;
 if (in == 0)
  return 64;
 if ((in & UINT64_C(0xffffffff)) == 0)
 {
  r += 32;
  in >>= 32;
 }
 if ((in & UINT64_C(0xffff)) == 0)
 {
  r += 16;
  in >>= 16;
 }
 if ((in & UINT64_C(0xff)) == 0)
 {
  r += 8;
  in >>= 8;
 }
 if ((in & UINT64_C(0xf)) == 0)
 {
  r += 4;
  in >>= 4;
 }
 if ((in & UINT64_C(3)) == 0)
 {
  r += 2;
  in >>= 2;
 }
 if ((in & 1) == 0)
  ++r;
 return r;
}


int main(){
    ctz(0);
}
