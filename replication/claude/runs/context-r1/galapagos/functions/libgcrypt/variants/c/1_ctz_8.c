#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int i, r = 64;

 for (i = 63; i >= 0; i--)
 {
  if ((in >> i) & 1)
   r = i;
 }

 return r;
}


int main(){
    ctz(0);
}
