#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Preserve the reference's sign masks and replace only multiplication by a gate.
    // Selecting zero or the magnitude is identical to multiplication by its comparison.
    // Every other operation retains the reference's order, including threshold edges.
    int s1 = v >> 31;
    int s2;
    v ^= s1;
    v -= s1;
    if (!(v < 2 * t))
        v = 0;
    v -= t;
    s2 = v >> 31;
    v ^= s2;
    v -= s2;
    v = t - v;
    v += s1;
    v ^= s1;
    return v;
}


int main(){
    vp5_adjust(0,0);
}
