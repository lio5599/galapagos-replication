#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Approach: express the range masks as "x >= t" masks g = 0xFF - lt, and use nonzero masks
    // z = byte((0-(x^k))>>8). The equality mask is then 0xFF - z.
    // Then lt26 = 0xFF - g26, ~lt26 & lt52 = g26 & ~g52, ~lt52 & lt62 = g52 & ~g62, all as bytes.
    // This is the same logic in complemented form, so every unsigned input, x >= 64 included, matches.
    unsigned int g26 = 0xFFU - (((x - 26U) >> 8) & 0xFFU);
    unsigned int g52 = 0xFFU - (((x - 52U) >> 8) & 0xFFU);
    unsigned int g62 = 0xFFU - (((x - 62U) >> 8) & 0xFFU);
    unsigned int z62 = ((0U - (x ^ 62U)) >> 8) & 0xFFU;
    unsigned int z63 = ((0U - (x ^ 63U)) >> 8) & 0xFFU;
    return (int) (((0xFFU - g26) & (x + 'A')) | (g26 & (0xFFU - g52) & (x + 71U)) |
                  (g52 & (0xFFU - g62) & (x - 4U)) | ((0xFFU - z62) & '+') | ((0xFFU - z63) & '/'));
}


int main(){
    b64_byte_to_char(0);
}
