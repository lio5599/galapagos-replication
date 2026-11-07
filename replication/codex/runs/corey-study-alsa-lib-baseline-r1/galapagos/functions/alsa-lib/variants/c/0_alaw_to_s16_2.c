#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int segment;
    int magnitude;

    a_val ^= 0x55;
    segment = (a_val >> 4) & 7;
    magnitude = ((a_val & 15) << 4) + 8;

    if (segment > 0) {
        magnitude += 256;
        while (--segment > 0)
            magnitude *= 2;
    }

    return (a_val & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
