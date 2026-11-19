#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int magnitude;
    int result;

    if (v < 0) {
        magnitude = -v;
        if (magnitude >= 2 * t)
            magnitude = 0;
        result = magnitude - t;
        if (result < 0)
            result = -result;
        return -(t - result);
    }

    magnitude = v < 2 * t ? v : 0;
    result = magnitude - t;
    if (result < 0)
        return t + result;
    return t - result;
}


int main(){
    vp5_adjust(0,0);
}
