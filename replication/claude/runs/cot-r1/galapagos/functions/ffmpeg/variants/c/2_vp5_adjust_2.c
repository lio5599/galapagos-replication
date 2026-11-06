#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Multiply by an explicit sign s = -1 or +1. v == 0 must use +1 so 2t survives when t < 0.
    // The clamp c = a * (a < 2t) mirrors the reference multiply-by-comparison.
    // t - |c - t| is computed with a conditional absolute value.
    // s * r equals the reference's (r + s1) ^ s1 for every r it defines.
    int s = v < 0 ? -1 : 1;
    int a = v * s;
    int c = a * (a < 2 * t);
    int d = c - t;
    int r = t - (d < 0 ? -d : d);
    return s * r;
}


int main(){
    vp5_adjust(0,0);
}
