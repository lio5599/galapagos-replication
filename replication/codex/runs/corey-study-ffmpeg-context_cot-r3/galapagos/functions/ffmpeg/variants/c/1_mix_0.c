#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Computes a 2:1 weighted blend with each component divided by three.
    // Split the weighted sums into separate additions.
    // Preserve signed right shifts and truncation toward zero for red.
    int blue = c0 & 0x001F;
    int green = c0 & 0x03E0;
    int red = c0 >> 10;
    blue = blue + blue + (c1 & 0x001F);
    green = (green + green + (c1 & 0x03E0)) >> 5;
    red = red + red + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
