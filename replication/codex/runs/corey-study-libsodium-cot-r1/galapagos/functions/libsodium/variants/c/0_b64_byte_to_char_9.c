#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Keep masks at full unsigned width and truncate only the final result.
    // AND, OR, and complement act independently on each bit.
    // Consequently higher bits cannot affect the reference's low eight bits.
    // Unsigned arithmetic preserves wraparound for zero and maximum inputs.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int result;

    result = (a & (x + 'A')) |
             (~a & b & (x + ('a' - 26))) |
             (~b & c & (x + ('0' - 52))) |
             (~d & (unsigned int)'+') |
             (~e & (unsigned int)'/');
    return (int)(result & 255U);
}


int main(){
    b64_byte_to_char(0);
}
