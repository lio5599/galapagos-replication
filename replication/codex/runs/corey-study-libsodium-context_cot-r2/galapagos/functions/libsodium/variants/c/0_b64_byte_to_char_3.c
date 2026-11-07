#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Apply De Morgan's law to the final union of the five original terms.
    // This is a bitwise identity, including when extracted masks are not Boolean.
    // The intermediate terms retain the reference's unsigned wraparound behavior.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int t0 = a & (x + 'A');
    unsigned int t1 = (a ^ 0xFFU) & b & (x + ('a' - 26));
    unsigned int t2 = (b ^ 0xFFU) & c & (x + ('0' - 52));
    unsigned int t3 = ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & '+';
    unsigned int t4 = ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & '/';
    return ~(~t0 & ~t1 & ~t2 & ~t3 & ~t4);
}


int main(){
    b64_byte_to_char(0);
}
