#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Construct each of the eight result bits independently.
    // A bit is set exactly when an original contribution contains it.
    // This also handles overlapping or partial masks outside 0..63.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int result = 0U;
    unsigned int i;
    for (i = 0U; i < 8U; ++i) {
        unsigned int bit = 1U << i;
        if ((a & (x + 'A') & bit) ||
            ((a ^ 0xFFU) & b & (x + ('a' - 26)) & bit) ||
            ((b ^ 0xFFU) & c & (x + ('0' - 52)) & bit) ||
            (d & '+' & bit) || (e & '/' & bit))
            result |= bit;
    }
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
