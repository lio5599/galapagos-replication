#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 if (in == 0)
  return 64;

 return __builtin_ctzll((unsigned long long)in);
}


int main(){
    ctz(0);
}
