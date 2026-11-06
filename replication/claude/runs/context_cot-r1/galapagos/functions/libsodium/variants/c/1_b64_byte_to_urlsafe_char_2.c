#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Extracts bits 8..15 with an unsigned char cast instead of & 0xFF.
    // The cast reduces modulo 256, which equals masking with 0xFF.
    // The casts are stored back into unsigned int, so the later bitwise ops match.
    // Equality masks for 62 and 63 use the same 0U - (x ^ k) trick.
    unsigned int m26 = (unsigned char) ((x - 26U) >> 8);
    unsigned int m52 = (unsigned char) ((x - 52U) >> 8);
    unsigned int m62 = (unsigned char) ((x - 62U) >> 8);
    unsigned int e62 = ((unsigned int) (unsigned char) ((0U - (x ^ 62U)) >> 8)) ^ 0xFFU;
    unsigned int e63 = ((unsigned int) (unsigned char) ((0U - (x ^ 63U)) >> 8)) ^ 0xFFU;
    unsigned int r = m26 & (x + (unsigned int) 'A');
    r |= (m26 ^ 0xFFU) & m52 & (x + (unsigned int) ('a' - 26));
    r |= (m52 ^ 0xFFU) & m62 & (x + (unsigned int) ('0' - 52));
    r |= (e62 & (unsigned int) '-') | (e63 & (unsigned int) '_');
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
