#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Keeps the reference's gate multiplication and inner absolute-value mask.
    // Branches replace only the outer absolute value and sign restoration.
    // Thus zero, the strict 2*t boundary, and nonpositive t follow the same gate.
    // Assumes arithmetic signed right shift and defined reference arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int d, s, r;
    a *= a < 2 * t;
    d = a - t;
    s = d >> 31;
    d = (d ^ s) - s;
    r = t - d;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
