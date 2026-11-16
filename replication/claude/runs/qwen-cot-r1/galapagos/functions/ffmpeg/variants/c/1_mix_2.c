#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Use bitwise extraction for cleaner channel access.
    // Weight c0 twice as much as c1 in each channel.
    // Integer division by 3 performs floor averaging.
    // Shift results back to their bit positions in 5-6-5 format.
    int red = (2*(c0>>10) + (c1>>10)) / 3;
    int green = (2*((c0>>5)&0x3F) + ((c1>>5)&0x3F)) / 3;
    int blue = (2*(c0&0x1F) + (c1&0x1F)) / 3;
    return (red << 10) + (green << 5) + blue;
}


int main(){
    mix(0,0);
}
