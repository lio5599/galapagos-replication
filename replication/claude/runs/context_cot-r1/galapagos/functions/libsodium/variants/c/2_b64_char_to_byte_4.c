#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Each mask is formed as (~t & 0xFF00) >> 8, which equals ((t >> 8) & 0xFF) ^ 0xFF.
    // Both forms select inverted bits 8..15 of t, so the masks are identical.
    // The offsets are ANDed with 0xFF to match the byte-limited reference terms.
    // The last step uses the same mask form for x==0 and the reference's raw byte for c=='A'.
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        (((~(u - 65u) & 0xFF00u) >> 8) & ((~(90u - u) & 0xFF00u) >> 8) & (u - 65u)) |
        (((~(u - 97u) & 0xFF00u) >> 8) & ((~(122u - u) & 0xFF00u) >> 8) & (u - 71u)) |
        (((~(u - 48u) & 0xFF00u) >> 8) & ((~(57u - u) & 0xFF00u) >> 8) & (u + 4u)) |
        (((~(0u - (u ^ 43u)) & 0xFF00u) >> 8) & 62u) |
        (((~(0u - (u ^ 47u)) & 0xFF00u) >> 8) & 63u);

    return x | (((~(0u - x) & 0xFF00u) >> 8) & (((0u - (u ^ 65u)) & 0xFF00u) >> 8));
}


int main(){
    b64_char_to_byte(0);
}
