#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: smear the lowest set bit k upward with shift-or steps.
 // After smearing, bits k through 63 are set, which is 64 - k bits.
 // Starting from 64 and subtracting one per set bit leaves k.
 // If in == 0, nothing is set, so the result stays 64 as in the reference.
 int r = 64;
 in |= in << 1; in |= in << 2; in |= in << 4;
 in |= in << 8; in |= in << 16; in |= in << 32;
 while (in) { in &= in - 1; r--; }
 return r;
}


int main(){
    ctz(0);
}
