#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int magnitude = negative ? -v : v;
    int result;

    switch (magnitude < 2 * t) {
    case 0:
        result = t - (t < 0 ? -t : t);
        break;
    default:
        result = magnitude < t ? magnitude : 2 * t - magnitude;
        break;
    }

    if (negative)
        result = -result;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
