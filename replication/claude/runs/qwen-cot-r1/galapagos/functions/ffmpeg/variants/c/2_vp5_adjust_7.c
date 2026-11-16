#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // The function maps v to a value in [-t, t] based on proximity to 0 within [0,2t].
    // Bitwise ops avoid branches. Equivalent to reference by construction.
    int s2, s1 = v >> 31;
    v ^= s1;
    v -= s1;
    v *= v < 2*t;
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
