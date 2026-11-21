#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Binary search finds the largest quotient whose triple does not exceed each masked sum.
    // Sums are in zero through 93, so the half-open quotient interval zero through 32 suffices.
    // This gives exact division by three at both endpoints and for every remainder.
    // Red and final reconstruction retain the reference signed arithmetic.
    int sums[2];
    int quotients[2];
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int i;
    sums[0] = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    sums[1] = 2 * ((c0 & 0x03E0) >> 5) + ((c1 & 0x03E0) >> 5);
    for (i = 0; i < 2; ++i) {
        int low = 0;
        int high = 32;
        while (high - low > 1) {
            int middle = (low + high) / 2;
            if (3 * middle <= sums[i])
                low = middle;
            else
                high = middle;
        }
        quotients[i] = low;
    }
    return red / 3 * 1024 + quotients[1] * 32 + quotients[0];
}


int main(){
    mix(0,0);
}
