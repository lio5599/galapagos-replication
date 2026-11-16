#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s1 = v >> 31;
    int abs_v = (v ^ s1) - s1;
    int clamped = (abs_v < 2 * t) ? abs_v : 0;
    int diff = clamped - t;
    int abs_diff = (diff ^ (diff >> 31)) - (diff >> 31);
    int result = t - abs_diff;
    result = (result ^ s1) - s1;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
