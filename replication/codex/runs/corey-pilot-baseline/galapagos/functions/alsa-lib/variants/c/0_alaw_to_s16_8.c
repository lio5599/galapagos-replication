#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    static const int mantissa[16] = {
        8, 24, 40, 56, 72, 88, 104, 120,
        136, 152, 168, 184, 200, 216, 232, 248
    };
    int decoded = a_val ^ 0x55;
    int exponent = (decoded >> 4) & 7;
    int magnitude = mantissa[decoded & 15];

    if (exponent)
        magnitude = ((magnitude + 256) << exponent) / 2;

    return (decoded & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
