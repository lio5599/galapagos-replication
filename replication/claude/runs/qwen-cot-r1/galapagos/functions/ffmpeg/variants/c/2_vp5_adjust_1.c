#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Equivalent: compute absolute value, clamp to [0,2t], compute distance from t,
    // then adjust sign. Uses ternary-like logic via bitwise ops for abs and clamp.
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
