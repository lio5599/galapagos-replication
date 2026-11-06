#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Shifting left by k makes in zero exactly when k >= 64 - ctz(in).
 // The loop therefore runs 64 - ctz(in) times, decrementing r from 64.
 // For in == 0 the loop does not run and r stays 64, as in the reference.
 int r = 64;
 while (in)
 {
  in <<= 1;
  r--;
 }
 return r;
}


int main(){
    ctz(0);
}
