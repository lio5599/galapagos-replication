#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 const uint64_t debruijn = 0x022fdd63cc95386dULL;
 int table[64];
 int i;

 if (in == 0)
  return 64;

 for (i = 0; i < 64; i++)
  table[(int)(((1ULL << i) * debruijn) >> 58)] = i;

 return table[(int)(((in & (~in + 1)) * debruijn) >> 58)];
}


int main(){
    ctz(0);
}
