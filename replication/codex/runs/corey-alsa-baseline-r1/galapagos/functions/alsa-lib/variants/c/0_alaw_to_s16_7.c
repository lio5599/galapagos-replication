#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    unsigned int decoded, segment, magnitude;

    decoded = (unsigned int)a_val ^ 0x55u;
    segment = (decoded >> 4) & 7u;
    magnitude = (decoded & 15u) * 16u + 8u;

    if (segment != 0u)
        magnitude = ((magnitude + 256u) << segment) >> 1;

    return (decoded & 128u) ? (int)magnitude : -(int)magnitude;
}


int main(){
    alaw_to_s16('a');
}
