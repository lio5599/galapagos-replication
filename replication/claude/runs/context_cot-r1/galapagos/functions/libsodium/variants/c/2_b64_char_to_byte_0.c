#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Reference: decodes a Base64 char (A-Z,a-z,0-9,+,/) to 0..63 via branchless byte masks.
    // Each mask ((t>>8)&0xFF)^0xFF equals (~t>>8)&0xFF, so it is rewritten with bitwise not.
    // c - k is computed in unsigned arithmetic, which matches the low byte wherever the
    // reference is defined. Only bits 0..15 matter, so odd inputs are reproduced exactly.
    // x is at most 0xFF. The final term is applied only when x is 0, giving 0xFF unless
    // the byte of -(c^'A') says otherwise, exactly as in the reference.
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((~(u - 65u) >> 8) & (~(90u - u) >> 8) & (u - 65u) & 0xFFu) |
        ((~(u - 97u) >> 8) & (~(122u - u) >> 8) & (u - 71u) & 0xFFu) |
        ((~(u - 48u) >> 8) & (~(57u - u) >> 8) & (u + 4u) & 0xFFu) |
        ((~(0u - (u ^ 43u)) >> 8) & 62u) |
        ((~(0u - (u ^ 47u)) >> 8) & 63u);

    return x | ((~(0u - x) >> 8) & ((0u - (u ^ 65u)) >> 8) & 0xFFu);
}


int main(){
    b64_char_to_byte(0);
}
