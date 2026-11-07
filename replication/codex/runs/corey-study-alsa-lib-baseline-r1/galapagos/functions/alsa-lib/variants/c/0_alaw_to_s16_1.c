#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int mantissa = (a_val ^ 0x05) & 15;
    int segment = ((a_val >> 4) ^ 0x05) & 7;
    int magnitude = segment
        ? (2 * mantissa + 33) << (segment + 2)
        : (2 * mantissa + 1) * 8;

    return (a_val & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
