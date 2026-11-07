#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Evaluate the reference independently for each of its eight output bits.
    // Each condition tests exactly one original masked contribution.
    // No range assumption is made, so partial masks and unsigned wrap are preserved.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int result = 0U;
    unsigned int bit;

    for (bit = 1U; bit < 256U; bit <<= 1) {
        if (((a & bit) && ((x + 'A') & bit)) ||
            (!(a & bit) && (b & bit) && ((x + ('a' - 26)) & bit)) ||
            (!(b & bit) && (c & bit) && ((x + ('0' - 52)) & bit)) ||
            ((d & bit) && ('-' & bit)) ||
            ((e & bit) && ('_' & bit)))
            result |= bit;
    }

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
