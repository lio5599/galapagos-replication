#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Combine the fields with bitwise OR instead of addition.
    // red/3*1024 has its low 10 bits zero in two's complement, even when negative.
    // green/3 <= 31 occupies bits 5..9 and blue/3 <= 31 occupies bits 0..4.
    // The fields do not overlap, so OR gives the same value as the sum.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return (red / 3 * 1024) | (green / 3 * 32) | (blue / 3);
}


int main(){
    mix(0,0);
}
