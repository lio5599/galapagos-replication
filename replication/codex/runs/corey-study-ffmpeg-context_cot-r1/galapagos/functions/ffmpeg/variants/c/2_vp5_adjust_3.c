#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // For sign masks zero and minus one, subtracting the mask adds its low bit.
    // The final addition of the mask likewise subtracts its low bit.
    // These substitutions preserve each intermediate value and overflow boundary.
    int s2, s1 = v >> 31;
    v ^= s1;
    v += s1 & 1;
    v *= v < 2 * t;
    v -= t;
    s2 = v >> 31;
    v ^= s2;
    v += s2 & 1;
    v = t - v;
    v -= s1 & 1;
    v ^= s1;
    return v;
}


int main(){
    vp5_adjust(0,0);
}
