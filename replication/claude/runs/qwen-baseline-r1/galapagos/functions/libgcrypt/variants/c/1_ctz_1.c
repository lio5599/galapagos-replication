#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0;
 while (in != 0 && (in & 1) == 0)
 {
  in >>= 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
