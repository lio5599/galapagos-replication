#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Count complete groups of three by repeated subtraction.
    // Bounded numerators are nonnegative and at most 93, ensuring termination.
    // Zero and exact multiples of three produce their exact quotients.
    // Signed red and final packing use the reference operations.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int qb = 0;
    int qg = 0;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    while (blue >= 3) {
        blue -= 3;
        ++qb;
    }
    while (green >= 3) {
        green -= 3;
        ++qg;
    }
    return red / 3 * 1024 + qg * 32 + qb;
}


int main(){
    mix(0,0);
}
