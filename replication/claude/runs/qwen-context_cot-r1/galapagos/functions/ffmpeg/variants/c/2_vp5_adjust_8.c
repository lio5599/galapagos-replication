#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Use arithmetic to avoid branches where possible.
    // max(v, 0) can be written as (v + abs(v)) / 2, but abs needs care.
    // Instead, use conditional for max.
    int max_v0 = v > 0 ? v : 0;
    // min(max_v0, t) can be written as max_v0 - max(max_v0 - t, 0).
    int diff = max_v0 - t;
    int max_diff0 = diff > 0 ? diff : 0;
    return max_v0 - max_diff0;
}


int main(){
    vp5_adjust(0,0);
}
