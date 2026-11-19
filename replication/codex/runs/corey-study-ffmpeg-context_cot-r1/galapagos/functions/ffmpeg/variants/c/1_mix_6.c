#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Subtracting each signed remainder makes its numerator divisible by 3.
    // The identity (v - v%3)/3 equals v/3 even when v is negative.
    // Weighted component bounds make the remainder subtraction safe.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 992) + (c1 & 992)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    blue = (blue - blue % 3) / 3;
    green = (green - green % 3) / 3;
    red = (red - red % 3) / 3;
    return red * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
