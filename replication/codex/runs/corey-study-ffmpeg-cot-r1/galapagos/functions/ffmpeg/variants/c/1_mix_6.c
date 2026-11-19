#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Implements division by counting signed groups of three for every component.
    // Positive sums decrease and negative sums increase toward zero.
    // Stopping between -2 and 2 exactly implements truncation toward zero.
    // No negation of a potentially minimum signed value is needed.
    int sums[3];
    int quotients[3] = { 0, 0, 0 };
    int i;
    sums[0] = 2 * (c0 & 31) + (c1 & 31);
    sums[1] = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    sums[2] = 2 * (c0 >> 10) + (c1 >> 10);
    for (i = 0; i < 3; ++i) {
        while (sums[i] >= 3) {
            sums[i] -= 3;
            ++quotients[i];
        }
        while (sums[i] <= -3) {
            sums[i] += 3;
            --quotients[i];
        }
    }
    return quotients[2] * 1024 + quotients[1] * 32 + quotients[0];
}


int main(){
    mix(0,0);
}
