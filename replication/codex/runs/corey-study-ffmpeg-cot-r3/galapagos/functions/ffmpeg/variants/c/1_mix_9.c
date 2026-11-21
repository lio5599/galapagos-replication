#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Complement bounded channels around their maximum value of 31.
    // The weighted complement is 93 minus the original numerator.
    // Subtracting its ceiling quotient from 31 gives the original floor.
    // Adding two implements that ceiling, including complements 0 and 93.
    // Signed red and the final arithmetic remain as in the reference.
    int blue = 2 * (31 - (c0 & 31)) + (31 - (c1 & 31));
    int green = 2 * (31 - ((c0 & 0x03E0) >> 5))
              + (31 - ((c1 & 0x03E0) >> 5));
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    blue = 31 - (blue + 2) / 3;
    green = 31 - (green + 2) / 3;
    return red / 3 * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
