#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Adding each first channel twice is equivalent to multiplying it by two.
    // Masked channels are nonnegative and at most 31, so their sums cannot overflow.
    // Red retains the reference shifts, signed division, and output evaluation order.
    // This also preserves behavior for negative inputs wherever the reference is defined.
    int blue = c0 & 0x001F;
    int green = (c0 & 0x03E0) >> 5;
    int red = c0 >> 10;
    blue = blue + blue + (c1 & 0x001F);
    green = green + green + ((c1 & 0x03E0) >> 5);
    red = red + red + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
