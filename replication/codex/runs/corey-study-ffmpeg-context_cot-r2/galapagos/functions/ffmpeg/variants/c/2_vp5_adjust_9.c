#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Writes the gated fold as a minus twice the positive part of a - t.
    // Two separate subtractions avoid overflowing an intermediate doubling.
    // This matters at the lowest defined negative threshold.
    // Normalization and restoration agree with the reference on defined inputs.
    int negative = v < 0;
    int a = negative ? -v : v;
    int d;
    int r;
    if (!(a < 2 * t))
        a = 0;
    d = a - t;
    if (d < 0)
        d = 0;
    r = a - d;
    r -= d;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
