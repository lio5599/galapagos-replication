#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Construct the five gates before applying the character expressions.
    // Reassociation of unsigned bitwise AND preserves even partial masks for arbitrary inputs.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int g1 = (a ^ 255U) & b;
    unsigned int g2 = (b ^ 255U) & c;
    unsigned int g3 = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int g4 = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    return (a & (x + 'A')) |
           (g1 & (x + ('a' - 26))) |
           (g2 & (x + ('0' - 52))) |
           (g3 & '-') |
           (g4 & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
