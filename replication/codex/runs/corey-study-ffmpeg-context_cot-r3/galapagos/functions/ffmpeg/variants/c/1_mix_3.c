#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Replace each weighted sum 2*x+y with x+(x+y).
    // Component bounds keep the regrouped intermediate sums in range.
    // The original signed red shift and division are preserved.
    int b0 = c0 & 0x001F;
    int b1 = c1 & 0x001F;
    int g0 = c0 & 0x03E0;
    int g1 = c1 & 0x03E0;
    int r0 = c0 >> 10;
    int r1 = c1 >> 10;
    int blue = b0 + (b0 + b1);
    int green = (g0 + (g0 + g1)) >> 5;
    int red = r0 + (r0 + r1);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
