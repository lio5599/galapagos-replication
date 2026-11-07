#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Accumulate contributions using XOR only for previously unset bits.
    // r XOR (t AND NOT r) equals r OR t, even when contributions overlap.
    // Original unsigned masks preserve all boundary and out-of-range cases.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int terms[5] = {
        a & (x + 'A'),
        (a ^ 0xFFU) & b & (x + ('a' - 26)),
        (b ^ 0xFFU) & (((x - 62U) >> 8) & 0xFFU) &
            (x + ('0' - 52)),
        ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & '+',
        ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & '/'
    };
    unsigned int result = 0U;
    unsigned int i;
    for (i = 0U; i < 5U; ++i)
        result ^= terms[i] & ~result;
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
