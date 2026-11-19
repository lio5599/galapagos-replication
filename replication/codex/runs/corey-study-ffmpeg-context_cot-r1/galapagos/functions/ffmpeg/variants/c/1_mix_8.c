#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // For nonnegative values through 93, (v*86)>>8 equals v/3 exactly.
    // Both masked weighted components satisfy this bound, including endpoints.
    // Red is not masked or approximated, preserving its full signed semantics.
    int blue = (c0 & 31) + ((c0 & 31) + (c1 & 31));
    int green = ((c0 & 992) >> 5)
              + (((c0 & 992) >> 5) + ((c1 & 992) >> 5));
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024
         + ((green * 86) >> 8) * 32
         + ((blue * 86) >> 8);
}


int main(){
    mix(0,0);
}
