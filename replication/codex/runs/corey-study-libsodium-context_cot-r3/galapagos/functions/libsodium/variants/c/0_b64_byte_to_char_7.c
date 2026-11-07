#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Compute the bitwise expression in bits 8 through 15 instead of bits 0 through 7.
    // Byte-limited payloads shift safely, and the final shift restores their positions.
    // Subtractions remain unsigned, preserving every wrapped or out-of-range case.
    unsigned int a = x - 26U;
    unsigned int b = x - 52U;
    unsigned int c = x - 62U;
    unsigned int d = 0U - (x ^ 62U);
    unsigned int e = 0U - (x ^ 63U);
    unsigned int upper = ((x + 'A') & 255U) << 8;
    unsigned int lower = ((x + ('a' - 26)) & 255U) << 8;
    unsigned int digit = ((x + ('0' - 52)) & 255U) << 8;
    unsigned int plus = ('+' & 255U) << 8;
    unsigned int slash = ('/' & 255U) << 8;
    return ((a & upper) | (~a & b & lower) | (~b & c & digit) |
            (~d & plus) | (~e & slash)) >> 8;
}


int main(){
    b64_byte_to_char(0);
}
