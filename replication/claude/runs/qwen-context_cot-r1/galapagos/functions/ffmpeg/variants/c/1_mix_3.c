#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Process each channel independently using masks and shifts.
    // Weighted average: (2*c0 + c1)/3 per channel.
    // Pack using bitwise OR after shifting to correct positions.
    int red_sum = 2 * (c0 >> 10) + (c1 >> 10);
    int green_sum = 2 * ((c0 >> 5) & 0x3F) + ((c1 >> 5) & 0x3F);
    int blue_sum = 2 * (c0 & 0x1F) + (c1 & 0x1F);
    int r = red_sum / 3;
    int g = green_sum / 3;
    int b = blue_sum / 3;
    return (r << 10) + (g << 5) + b;
}


int main(){
    mix(0,0);
}
