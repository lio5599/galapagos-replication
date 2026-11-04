#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 uint64_t lowbit;
 int r = 0;

 if (in == 0)
  return 64;

 lowbit = in & (~in + 1);

 while (lowbit > 1)
 {
  lowbit >>= 1;
  r++;
 }

 return r;
}


int main(){
    ctz(0);
}
