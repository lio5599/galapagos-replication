#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 uint64_t y = in & (~in + 1);
 int r = 64;

 if (y)
  r -= 1;
 if (y & 0x00000000FFFFFFFFULL)
  r -= 32;
 if (y & 0x0000FFFF0000FFFFULL)
  r -= 16;
 if (y & 0x00FF00FF00FF00FFULL)
  r -= 8;
 if (y & 0x0F0F0F0F0F0F0F0FULL)
  r -= 4;
 if (y & 0x3333333333333333ULL)
  r -= 2;
 if (y & 0x5555555555555555ULL)
  r -= 1;

 return r;
}


int main(){
    ctz(0);
}
