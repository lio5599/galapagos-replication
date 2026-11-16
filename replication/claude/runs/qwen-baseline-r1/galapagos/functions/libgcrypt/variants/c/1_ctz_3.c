#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 uint64_t mask = 1;
 while (r < 64 && (in & mask) == 0)
 {
  r++;
  mask <<= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
