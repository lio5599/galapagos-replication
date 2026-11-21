#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Computes per-channel 2:1 weighted averages, truncating division by three.
    // Extracting green before weighting is exact because its mask is aligned.
    // Blue and green range from 0 to 31, including both endpoints.
    // Signed red shifting and division retain the reference's behavior.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = 2 * ((c0 >> 5) & 31) + ((c1 >> 5) & 31);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
