#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // The two range masks are merged by De Morgan: (~p>>8)&(~q>>8) == ~(p|q)>>8.
    // This gives the same per-bit AND of bits 8..15 as the reference's two masks.
    // The offset is then ANDed and the result truncated to a byte as in the reference.
    // The '+' and '/' checks keep the reference's 0-(c^k) form with the xor 0xFF.
    // x is at most 0xFF, so x is returned when nonzero; otherwise the reference's byte.
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((~((u - 65u) | (90u - u)) >> 8) & (u - 65u) & 0xFFu) |
        ((~((u - 97u) | (122u - u)) >> 8) & (u - 71u) & 0xFFu) |
        ((~((u - 48u) | (57u - u)) >> 8) & (u + 4u) & 0xFFu) |
        (((((0u - (u ^ 43u)) >> 8) & 0xFFu) ^ 0xFFu) & 62u) |
        (((((0u - (u ^ 47u)) >> 8) & 0xFFu) ^ 0xFFu) & 63u);

    if (x != 0u) {
        return x;
    }
    return ((0u - (u ^ 65u)) >> 8) & 0xFFu;
}


int main(){
    b64_char_to_byte(0);
}
