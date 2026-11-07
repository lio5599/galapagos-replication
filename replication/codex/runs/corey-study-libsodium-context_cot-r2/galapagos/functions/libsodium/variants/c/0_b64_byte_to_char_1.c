#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Accumulate the original five terms using associative bitwise OR.
    // Each subtraction remains unsigned, preserving wraparound for every input.
    // All extracted masks retain their complete byte values.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int result = a & (x + 'A');
    result |= (a ^ 0xFFU) & b & (x + ('a' - 26));
    result |= (b ^ 0xFFU) & c & (x + ('0' - 52));
    result |= ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & '+';
    result |= ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & '/';
    return result;
}


int main(){
    b64_byte_to_char(0);
}
