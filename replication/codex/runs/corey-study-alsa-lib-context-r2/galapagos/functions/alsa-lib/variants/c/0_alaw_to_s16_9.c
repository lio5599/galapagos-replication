#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int x = a_val ^ 0x55;
    int seg = (x >> 4) & 7;
    int t;

    if (seg == 0) {
        t = ((x & 15) << 4) + 8;
    } else {
        int scale = 1 << (seg - 1);
        t = (x & 15) * (scale << 4) + (scale << 8) + (scale << 3);
    }

    return (a_val < 128) ? -t : t;
}


int main(){
    alaw_to_s16('a');
}
