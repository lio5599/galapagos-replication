#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Extract candidate low bytes before applying the original masks.
    // Higher candidate bits cannot survive any eight-bit selection mask.
    // All additions remain unsigned, preserving wraparound for every x.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int upper = (x + 'A') & 0xFFU;
    unsigned int lower = (x + ('a' - 26)) & 0xFFU;
    unsigned int digit = (x + ('0' - 52)) & 0xFFU;
    unsigned int result = a & upper;
    result |= (0xFFU ^ a) & b & lower;
    result |= (0xFFU ^ b) & c & digit;
    result |= (0xFFU ^ (((0U - (x ^ 62U)) >> 8) & 0xFFU)) & '+';
    result |= (0xFFU ^ (((0U - (x ^ 63U)) >> 8) & 0xFFU)) & '/';
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
