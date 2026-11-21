#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Split nonnegative blue and green inputs into quotients and remainders modulo three.
    // The quotient contributions are exact integers; the combined remainders supply the carry.
    // This identity covers every masked value, including zero and 31.
    // Red retains the reference expression so negative signed division is unchanged.
    int b0 = c0 & 0x001F;
    int b1 = c1 & 0x001F;
    int g0 = (c0 & 0x03E0) >> 5;
    int g1 = (c1 & 0x03E0) >> 5;
    int blue = 2 * (b0 / 3) + b1 / 3
             + (2 * (b0 % 3) + b1 % 3) / 3;
    int green = 2 * (g0 / 3) + g1 / 3
              + (2 * (g0 % 3) + g1 % 3) / 3;
    int red = (2 * (c0 >> 10) + (c1 >> 10)) / 3;
    return red * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
