#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Uses binary long division by three for the two nonnegative component sums.
    // Seven input bits cover every possible sum from 0 through 93.
    // Each step keeps a remainder below 3, producing the exact quotient.
    // Zero and endpoint sums are handled naturally; signed red remains unchanged.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int b = 0;
    int g = 0;
    int br = 0;
    int gr = 0;
    int bit;
    for (bit = 6; bit >= 0; --bit) {
        br = 2 * br + ((blue >> bit) & 1);
        gr = 2 * gr + ((green >> bit) & 1);
        b *= 2;
        g *= 2;
        if (br >= 3) {
            br -= 3;
            ++b;
        }
        if (gr >= 3) {
            gr -= 3;
            ++g;
        }
    }
    return (red / 3) * 1024 + g * 32 + b;
}


int main(){
    mix(0,0);
}
