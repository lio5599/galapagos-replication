#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s1 = v >> 31;
    int magnitude = (v ^ s1) - s1;
    int selected = magnitude * (magnitude < 2 * t);
    int delta = selected - t;
    int s2 = delta >> 31;
    int distance = (delta ^ s2) - s2;
    int result = t - distance;
    return (result + s1) ^ s1;
}


int main(){
    vp5_adjust(0,0);
}
