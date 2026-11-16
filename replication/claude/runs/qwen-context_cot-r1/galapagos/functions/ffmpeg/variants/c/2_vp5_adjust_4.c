#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Use min/max functions conceptually, implemented inline.
    // First ensure v is non-negative by taking max(v, 0).
    // Then take min of that result with t.
    int max_v0 = (v > 0) ? v : 0;
    return (max_v0 < t) ? max_v0 : t;
}


int main(){
    vp5_adjust(0,0);
}
