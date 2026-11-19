#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Keeps green in its masked position and divides its weighted sum by 96.
    // That sum is nonnegative and exactly 32 times the extracted green sum.
    // Red uses the original signed operations, preserving negative-input behavior.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green_scaled = 2 * (c0 & 992) + (c1 & 992);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green_scaled / 96 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
