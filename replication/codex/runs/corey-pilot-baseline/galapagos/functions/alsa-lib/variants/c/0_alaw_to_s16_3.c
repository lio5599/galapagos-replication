#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int decoded = a_val ^ 0x55;
    int segment = (decoded >> 4) & 7;
    int magnitude = (decoded & 15) * 16 + 8;

    if (segment > 0) {
        magnitude += 256;
        while (--segment > 0)
            magnitude *= 2;
    }

    return (decoded & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
