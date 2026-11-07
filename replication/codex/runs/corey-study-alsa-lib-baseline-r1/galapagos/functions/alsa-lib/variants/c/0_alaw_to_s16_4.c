#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    static const int scale[8] = { 1, 1, 2, 4, 8, 16, 32, 64 };
    int segment;
    int magnitude;

    a_val ^= 0x55;
    segment = (a_val >> 4) & 7;
    magnitude = (((a_val & 15) * 16) + 264) * scale[segment];

    if (segment == 0)
        magnitude -= 256;

    return (a_val & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
