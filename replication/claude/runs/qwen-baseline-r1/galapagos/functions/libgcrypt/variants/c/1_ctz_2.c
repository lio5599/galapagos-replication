#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 for (int i = 0; i < 64; i++)
 {
  if ((in & ((uint64_t)1 << i)) != 0)
   break;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
