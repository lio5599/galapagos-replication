#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Apply De Morgan's law to the union of the five contributions.
    // Complementing their intersection recovers precisely their bitwise OR.
    // Unsigned masks and arithmetic retain all out-of-range behavior.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int result = ~(a & (x + 'A'));
    result &= ~((a ^ 0xFFU) & b & (x + ('a' - 26)));
    result &= ~((b ^ 0xFFU) & c & (x + ('0' - 52)));
    result &= ~(d & '+');
    result &= ~(e & '/');
    return (int)~result;
}


int main(){
    b64_byte_to_char(0);
}
