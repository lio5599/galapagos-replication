#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Uses mask m = -(v < 0), which is 0 or -1, like s1 but built from a comparison.
    // (x ^ m) - m gives |x| for the input and negates the result when m = -1.
    // This equals the reference's (r + m) ^ m, since both yield -r for m = -1.
    // The middle step t - |c - t| uses its own mask from (d < 0). Edge cases are unchanged.
    int m = -(v < 0);
    int a = (v ^ m) - m;
    int c = a < 2 * t ? a : 0;
    int d = c - t;
    int md = -(d < 0);
    int r = t - ((d ^ md) - md);
    return (r ^ m) - m;
}


int main(){
    vp5_adjust(0,0);
}
