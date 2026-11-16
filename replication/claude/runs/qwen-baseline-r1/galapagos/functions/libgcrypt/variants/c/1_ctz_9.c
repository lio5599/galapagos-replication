#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 for (int i = 0; i < 64; i++)
 {
  r += !((in >> i) & 1);
  if ((in >> i) & 1)
   break;
 }
 return r;
}


int main(){
    ctz(0);
}
