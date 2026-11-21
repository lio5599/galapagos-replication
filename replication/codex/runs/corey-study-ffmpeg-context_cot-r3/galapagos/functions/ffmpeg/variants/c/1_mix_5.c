#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Remove each division remainder before dividing.
    // C's signed remainder identity makes this exact even for negative red.
    // Component bounds keep the remainder subtractions in range.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    blue = (blue - blue % 3) / 3;
    green = (green - green % 3) / 3;
    red = (red - red % 3) / 3;
    return red * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
