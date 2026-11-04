#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;

 while (r < 64 && ((in >> r) & 1) == 0)
  r++;

 return r;
}


int main(){
    ctz(0);
}
