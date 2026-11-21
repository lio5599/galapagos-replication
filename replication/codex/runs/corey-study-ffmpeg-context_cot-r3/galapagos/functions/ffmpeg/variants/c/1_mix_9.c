#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Assemble the low components first, then add the scaled red average.
    // The low-component subtotal is between zero and 1023 and cannot overflow.
    // The final mathematical sum and signed red truncation match the reference.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int result = blue / 3;
    result += green / 3 * 32;
    result += red / 3 * 1024;
    return result;
}


int main(){
    mix(0,0);
}
