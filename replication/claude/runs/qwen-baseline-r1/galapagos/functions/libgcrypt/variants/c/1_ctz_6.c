#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 uint64_t temp = in;
 for (int i = 0; i < 64; i++)
 {
  if (temp & 1)
   break;
  r++;
  temp >>= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
