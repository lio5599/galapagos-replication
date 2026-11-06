#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Replaces each subtraction by a constant with the addition of its 2^32 complement.
    // x - 26, x - 52, x - 62 and x - 4 become x + 0xFFFFFFE6, 0xFFFFFFCC, 0xFFFFFFC2, 0xFFFFFFFC.
    // In 32-bit unsigned arithmetic these are bit-identical, so every mask and term matches.
    unsigned int m26 = ((x + 0xFFFFFFE6U) >> 8) & 0xFFU;
    unsigned int m52 = ((x + 0xFFFFFFCCU) >> 8) & 0xFFU;
    unsigned int m62 = ((x + 0xFFFFFFC2U) >> 8) & 0xFFU;
    unsigned int e62 = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e63 = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    return (int) ((m26 & (x + 65U)) | ((m26 ^ 0xFFU) & m52 & (x + 71U)) |
                  ((m52 ^ 0xFFU) & m62 & (x + 0xFFFFFFFCU)) | (e62 & 45U) | (e63 & 95U));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
