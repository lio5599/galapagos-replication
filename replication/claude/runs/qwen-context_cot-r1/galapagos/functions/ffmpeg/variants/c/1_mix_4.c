#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Inline channel extraction and averaging.
    // Red is bits 10-14, Green is bits 5-10, Blue is bits 0-4.
    // Each averaged as (2*c0 + c1)/3, then packed via shifts.
    int r = (2 * (c0 >> 10) + (c1 >> 10)) / 3;
    int g = (2 * ((c0 >> 5) & 0x3F) + ((c1 >> 5) & 0x3F)) / 3;
    int b = (2 * (c0 & 0x1F) + (c1 & 0x1F)) / 3;
    return r * 1024 + g * 32 + b;
}


int main(){
    mix(0,0);
}
