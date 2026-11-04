#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 uint64_t mask = (in & (~in + 1)) - 1;
 int r = 0;

 while (mask)
 {
  r += (int)(mask & 1);
  mask >>= 1;
 }

 return r;
}


int main(){
    ctz(0);
}
