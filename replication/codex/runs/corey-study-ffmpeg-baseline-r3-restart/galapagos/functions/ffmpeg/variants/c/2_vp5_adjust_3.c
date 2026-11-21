#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int magnitude = v < 0 ? -v : v;
    int result;

    if (magnitude < 2 * t)
        result = magnitude > t ? 2 * t - magnitude : magnitude;
    else
        result = t < 0 ? 2 * t : 0;

    return v < 0 ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
