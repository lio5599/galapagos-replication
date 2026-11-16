#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 uint64_t shifted = in;
 while (r < 64)
 {
  if (shifted & 1)
   break;
  shifted >>= 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
