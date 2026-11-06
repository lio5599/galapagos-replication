#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Approach: blue and green sums lie in 0..93, so x / 3 == (x * 171) >> 9 there.
    // 171/512 exceeds 1/3 by x/1536, which stays below 1/3 for x < 512, so the floor is unchanged.
    // Red can be negative or large, so it keeps the exact C division as in the reference.
    int blue = 2 * (c0 & 0x1F) + (c1 & 0x1F);
    int green = 2 * ((c0 >> 5) & 0x1F) + ((c1 >> 5) & 0x1F);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + ((green * 171) >> 9) * 32 + ((blue * 171) >> 9);
}


int main(){
    mix(0,0);
}
