#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // De Morgan's law replaces the final OR with complemented AND operations.
    // All five contributions retain the reference's exact byte masks.
    // The final byte mask preserves the result for every unsigned input.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int upper = a & (x + 'A');
    unsigned int lower = (a ^ 255U) & b & (x + ('a' - 26));
    unsigned int digit = (b ^ 255U) & c & (x + ('0' - 52));
    unsigned int plus = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '+';
    unsigned int slash = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '/';
    return ~(~upper & ~lower & ~digit & ~plus & ~slash) & 255U;
}


int main(){
    b64_byte_to_char(0);
}
