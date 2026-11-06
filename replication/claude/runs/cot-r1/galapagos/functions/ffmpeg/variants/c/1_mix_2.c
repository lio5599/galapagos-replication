#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Approach: divide blue and green by 3 using repeated subtraction.
    // Both sums are nonnegative (0..93), so counting subtractions of 3 equals x / 3.
    // Red keeps the exact signed division, matching the reference for every input.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int qb = 0, qg = 0;
    while (blue >= 3) { blue -= 3; qb++; }
    while (green >= 3) { green -= 3; qg++; }
    return red / 3 * 1024 + qg * 32 + qb;
}


int main(){
    mix(0,0);
}
