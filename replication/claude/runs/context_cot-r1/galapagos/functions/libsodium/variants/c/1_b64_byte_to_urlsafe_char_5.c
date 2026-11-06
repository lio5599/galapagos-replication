#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Computes the negation 0U - v as the two's complement ~v + 1U.
    // Unsigned arithmetic is modulo 2^32, so ~v + 1 equals 0 - v for every v.
    // Range masks use x - k exactly as in the reference.
    // Bits 8..15 of the negated XOR are 0 only when x equals k, giving 0xFF after the flip.
    unsigned int m26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int m52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int m62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int e62 = (((~(x ^ 62U) + 1U) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e63 = (((~(x ^ 63U) + 1U) >> 8) & 0xFFU) ^ 0xFFU;
    return (int) ((m26 & (x + 65U)) | ((m26 ^ 0xFFU) & m52 & (x + 71U)) |
                  ((m52 ^ 0xFFU) & m62 & (x - 4U)) | (e62 & 45U) | (e63 & 95U));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
