#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Reverse the operand order in each weighted addition.
    // Commutativity preserves the sums without changing intermediate bounds.
    // All shifts, signed divisions, and final scaling remain unchanged.
    int blue = (c1 & 0x001F) + (c0 & 0x001F) * 2;
    int green = ((c1 & 0x03E0) + (c0 & 0x03E0) * 2) >> 5;
    int red = (c1 >> 10) + (c0 >> 10) * 2;
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
