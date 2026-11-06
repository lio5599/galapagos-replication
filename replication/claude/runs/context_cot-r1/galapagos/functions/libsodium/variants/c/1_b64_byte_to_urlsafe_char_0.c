#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Maps a 6-bit value to its URL-safe base64 char in constant time (A-Z,a-z,0-9,-,_).
    // Approach: name each byte mask and range term in a local variable.
    // m26/m52/m62 are bits 8..15 of x-26, x-52, x-62 (0xFF when x is below the bound).
    // e62/e63 are 0xFF exactly when x equals 62 or 63, as in the reference.
    // The same masked terms are ORed, so the result matches for every 32-bit x.
    unsigned int m26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int m52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int m62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int e62 = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e63 = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int r = (m26 & (x + 65U)) |
                     ((m26 ^ 0xFFU) & m52 & (x + 71U)) |
                     ((m52 ^ 0xFFU) & m62 & (x - 4U)) |
                     (e62 & 45U) |
                     (e63 & 95U);
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
