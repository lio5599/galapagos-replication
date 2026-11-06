#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Approach: keep green unshifted. G = 2*(c0&0x3E0) + (c1&0x3E0) = 32*g with g >= 0.
    // floor(32g / 96) == floor(g / 3), so G / 96 * 32 equals green / 3 * 32 from the reference.
    // Blue and red are computed exactly as in the reference.
    int G = 2 * (c0 & 0x03E0) + (c1 & 0x03E0);
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + G / 96 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
