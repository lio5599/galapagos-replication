#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int i;

 for (i = 0; i < 64; i++)
 {
  if ((in >> i) & 1)
   break;
 }

 return i;
}


int main(){
    ctz(0);
}
