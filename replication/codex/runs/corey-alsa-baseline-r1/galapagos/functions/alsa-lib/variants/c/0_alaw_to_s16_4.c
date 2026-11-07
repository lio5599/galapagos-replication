#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int segment, magnitude;

    a_val ^= 0x55;
    segment = (a_val >> 4) & 7;
    magnitude = (a_val & 15) * 16 + 8;

    if (segment != 0) {
        magnitude += 256;
        while (segment > 1) {
            magnitude *= 2;
            --segment;
        }
    }

    return (a_val & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
