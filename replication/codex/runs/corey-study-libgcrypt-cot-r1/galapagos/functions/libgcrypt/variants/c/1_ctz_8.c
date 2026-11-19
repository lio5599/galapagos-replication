#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Inspect bytes from least significant to most significant.
 // Each empty byte adds eight; count low zero bits in the first nonempty byte.
 // If every byte is zero, all eight iterations contribute eight, returning 64.
 int i, r = 0;
 unsigned int byte;
 for (i = 0; i < 8; ++i)
 {
  byte = (unsigned int)(in & UINT64_C(0xff));
  if (byte != 0)
  {
   while ((byte & 1U) == 0)
   {
    ++r;
    byte >>= 1;
   }
   return r;
  }
  r += 8;
  in >>= 8;
 }
 return r;
}


int main(){
    ctz(0);
}
