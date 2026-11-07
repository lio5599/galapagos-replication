#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    unsigned int decoded = (unsigned int)a_val ^ 0x55u;
    unsigned int exponent = (decoded >> 4) & 7u;
    unsigned int nonzero = exponent != 0;
    unsigned int magnitude =
        (((decoded & 15u) << 4) + 8u + (nonzero << 8))
        << (exponent - nonzero);

    return (2 * (int)(decoded >> 7) - 1) * (int)magnitude;
}


int main(){
    alaw_to_s16('a');
}
