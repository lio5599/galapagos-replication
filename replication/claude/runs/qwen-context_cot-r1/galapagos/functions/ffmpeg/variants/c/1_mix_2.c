#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Use shift-based channel extraction for clarity.
    // Compute average with weights 2 and 1, integer divide by 3.
    // Reconstruct RGB565 by shifting and adding.
    int r0 = c0 >> 10, r1 = c1 >> 10;
    int g0 = (c0 >> 5) & 63, g1 = (c1 >> 5) & 63;
    int b0 = c0 & 31, b1 = c1 & 31;
    int r = (2 * r0 + r1) / 3;
    int g = (2 * g0 + g1) / 3;
    int b = (2 * b0 + b1) / 3;
    return (r << 10) | (g << 5) | b;
}


int main(){
    mix(0,0);
}
