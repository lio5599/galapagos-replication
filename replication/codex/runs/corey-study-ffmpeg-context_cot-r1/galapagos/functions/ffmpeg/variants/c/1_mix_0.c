#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Computes a 2:1 weighted blend with each component divided by 3.
    // Extracting green before weighting is exact because its mask is aligned.
    // Red retains signed right shifts and division toward zero for negative inputs.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = 2 * ((c0 & 992) >> 5) + ((c1 & 992) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return (red / 3) * 1024 + (green / 3) * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
