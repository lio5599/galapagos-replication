#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int x = a_val ^ 0x55;
    int seg = (x >> 4) & 7;
    int t = (x & 15) * 16 + 8;

    if (seg != 0) {
        t += 256;
        t *= 1 << (seg - 1);
    }

    if ((x & 128) == 0)
        t = -t;

    return t;
}


int main(){
    alaw_to_s16('a');
}
