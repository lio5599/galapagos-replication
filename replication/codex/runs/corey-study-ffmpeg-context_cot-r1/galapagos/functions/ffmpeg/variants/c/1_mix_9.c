#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Divides red's magnitude and restores its sign explicitly.
    // Weighted shifted red values cannot reach INT_MIN, so negation is safe.
    // Restoring the sign implements truncation toward zero, including near zero.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 992) + (c1 & 992)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int red_quotient = red < 0 ? -((-red) / 3) : red / 3;
    return red_quotient * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
