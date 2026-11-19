#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Performs weighting and reconstruction in long, which is at least as wide as int.
    // Input red shifts still occur in int, preserving their implementation's behavior.
    // Signed division has the same truncation; nonnegative green extraction is exact.
    // Whenever the reference is defined, its result fits int and the cast is exact.
    long blue = 2L * (c0 & 31) + (c1 & 31);
    long green = 2L * ((c0 & 0x03E0) >> 5) + ((c1 & 0x03E0) >> 5);
    long red = 2L * (c0 >> 10) + (c1 >> 10);
    return (int)((red / 3) * 1024L + (green / 3) * 32L + blue / 3);
}


int main(){
    mix(0,0);
}
