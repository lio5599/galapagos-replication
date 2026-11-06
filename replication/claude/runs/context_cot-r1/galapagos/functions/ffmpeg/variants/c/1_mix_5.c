#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // The whole computation is done in 64-bit long long, then converted back.
    // Signed 64-bit division truncates the same way, and the shifts and masks
    // give identical channel values. The final value fits in int,
    // so the conversion back to int is exact.
    long long a = c0, b = c1;
    long long blue = 2 * (a & 0x1F) + (b & 0x1F);
    long long green = (2 * (a & 0x3E0) + (b & 0x3E0)) >> 5;
    long long red = 2 * (a >> 10) + (b >> 10);
    return (int)(red / 3 * 1024 + green / 3 * 32 + blue / 3);
}


int main(){
    mix(0,0);
}
