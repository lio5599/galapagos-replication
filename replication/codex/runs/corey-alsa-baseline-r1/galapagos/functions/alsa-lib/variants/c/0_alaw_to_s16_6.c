#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int segment, nonzero, magnitude;

    a_val ^= 0x55;
    segment = (a_val >> 4) & 7;
    nonzero = (segment != 0);
    magnitude = ((a_val & 15) << 4) + 8 + (nonzero << 8);
    magnitude <<= segment - nonzero;

    return magnitude - 2 * magnitude * (int)((a_val >> 7) ^ 1);
}


int main(){
    alaw_to_s16('a');
}
