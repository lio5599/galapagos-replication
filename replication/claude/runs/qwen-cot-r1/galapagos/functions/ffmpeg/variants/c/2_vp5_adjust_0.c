#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Reference computes: clamp v to [0, 2t], then return t - (v/2), handling negatives
    // s1 extracts sign bit of v; v ^= s1; v -= s1 makes v = |v|
    // v *= v < 2*t clamps v to [0, 2t-1] by zeroing if v >= 2t
    // v -= t; s2 extracts sign; v ^= s2; v -= s2 makes v = |v - t|
    // v = t - v gives t - |v - t|; v += s1; v ^= s1 restores sign if original v was negative
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
