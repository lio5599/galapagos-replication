#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Skip zero low blocks of successively smaller sizes.
 // Each skipped block contributes its size to the result.
 // A separate zero case returns 64; nonzero inputs retain a set bit.
 int r = 0;
 if (in == 0)
  return 64;
 if ((in & 0xFFFFFFFFULL) == 0)
 {
  r += 32;
  in >>= 32;
 }
 if ((in & 0xFFFFULL) == 0)
 {
  r += 16;
  in >>= 16;
 }
 if ((in & 0xFFULL) == 0)
 {
  r += 8;
  in >>= 8;
 }
 if ((in & 0xFULL) == 0)
 {
  r += 4;
  in >>= 4;
 }
 if ((in & 3) == 0)
 {
  r += 2;
  in >>= 2;
 }
 r += ((in & 1) == 0);
 return r;
}


int main(){
    ctz(0);
}
