#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Approach: the green and blue quotients are each in 0..31, so they occupy disjoint bits.
    // (qg << 5) | qb therefore equals qg * 32 + qb. Red is added arithmetically
    // because it may be negative. Each quotient is the same nonnegative division as the reference.
    int qb = (2 * (c0 & 0x1F) + (c1 & 0x1F)) / 3;
    int qg = (2 * ((c0 >> 5) & 0x1F) + ((c1 >> 5) & 0x1F)) / 3;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + ((qg << 5) | qb);
}


int main(){
    mix(0,0);
}
