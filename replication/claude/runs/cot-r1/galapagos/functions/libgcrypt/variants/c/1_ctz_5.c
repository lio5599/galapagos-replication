#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: de Bruijn multiply of the isolated lowest set bit.
 // The top 6 bits of the product are unique for each bit position.
 // A table built once maps those 6 bits back to the bit index.
 // in == 0 is checked first and returns 64, matching the reference.
 static unsigned char t[64];
 static int init = 0;
 int i;
 if (!init) { for (i = 0; i < 64; i++) t[((1ULL << i) * 0x03f79d71b4cb0a89ULL) >> 58] = (unsigned char)i; init = 1; }
 if (in == 0) return 64;
 return t[((in & (0 - in)) * 0x03f79d71b4cb0a89ULL) >> 58];
}


int main(){
    ctz(0);
}
