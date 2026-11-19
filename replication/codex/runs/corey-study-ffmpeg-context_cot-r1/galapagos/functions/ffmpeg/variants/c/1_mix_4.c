#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Packs the divided components using a base-32 Horner expression.
    // Blue and green quotients are in 0 through 31, so carries cannot occur.
    // The signed red quotient and all defined-result boundary cases are preserved.
    int blue = (2 * (c0 & 31) + (c1 & 31)) / 3;
    int green = (2 * ((c0 & 992) >> 5) + ((c1 & 992) >> 5)) / 3;
    int red = (2 * (c0 >> 10) + (c1 >> 10)) / 3;
    return (red * 32 + green) * 32 + blue;
}


int main(){
    mix(0,0);
}
