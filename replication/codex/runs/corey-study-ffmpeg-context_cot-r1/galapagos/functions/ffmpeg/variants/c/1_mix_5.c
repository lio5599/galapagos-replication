#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Uses 3*a - (a-b) to form each weighted component.
    // Shifted and masked component bounds prevent intermediate overflow.
    // Division remains signed, so negative red values retain truncation toward zero.
    int b0 = c0 & 31;
    int g0 = (c0 & 992) >> 5;
    int r0 = c0 >> 10;
    int blue = 3 * b0 - (b0 - (c1 & 31));
    int green = 3 * g0 - (g0 - ((c1 & 992) >> 5));
    int red = 3 * r0 - (r0 - (c1 >> 10));
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
