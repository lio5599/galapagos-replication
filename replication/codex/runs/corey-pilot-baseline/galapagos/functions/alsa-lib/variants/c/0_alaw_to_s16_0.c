#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int magnitude;
    int exponent;

    a_val ^= 0x55;
    exponent = (a_val >> 4) & 7;
    magnitude = ((a_val & 15) << 4) + 8;

    if (exponent != 0)
        magnitude = (magnitude + 256) << (exponent - 1);

    return (a_val & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
