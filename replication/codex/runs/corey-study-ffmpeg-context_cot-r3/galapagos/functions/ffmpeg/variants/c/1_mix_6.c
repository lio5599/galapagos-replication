#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Replace green's right shift with division by 32.
    // Its masked weighted sum is nonnegative, so the operations agree exactly.
    // Red keeps its original signed operations for all inputs.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) / 32;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
