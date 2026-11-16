#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Alternative 4: Use de Bruijn-like approach with conditional checks.
 // Check halves progressively to narrow down position.
 // First check lower 32 bits, then 16, 8, 4, 2, 1.
 // Accumulate offset as we skip zero blocks.
 int r = 0;
 if ((in & 0xFFFFFFFFULL) == 0) { r += 32; in >>= 32; }
 if ((in & 0xFFFFULL) == 0) { r += 16; in >>= 16; }
 if ((in & 0xFFULL) == 0) { r += 8; in >>= 8; }
 if ((in & 0xFULL) == 0) { r += 4; in >>= 4; }
 if ((in & 3ULL) == 0) { r += 2; in >>= 2; }
 if ((in & 1ULL) == 0) { r += 1; }
 return r;
}


int main(){
    ctz(0);
}
