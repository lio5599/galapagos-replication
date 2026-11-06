#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Uses the identity ((A>>8)&0xFF) & (B&0xFF) == ((A & (B<<8)) >> 8) & 0xFF.
    // The offset is shifted into bits 8..15 next to the inverted bounds, ANDed there,
    // and the combined result is shifted back down. Bit-for-bit this equals the reference.
    // The '+' and '/' constants are shifted the same way. The final x==0 test uses
    // ~(0-x), which has bits 8..15 all set only for x==0, because x is at most 0xFF.
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        (((~(u - 65u) & ~(90u - u) & ((u - 65u) << 8)) >> 8) & 0xFFu) |
        (((~(u - 97u) & ~(122u - u) & ((u - 71u) << 8)) >> 8) & 0xFFu) |
        (((~(u - 48u) & ~(57u - u) & ((u + 4u) << 8)) >> 8) & 0xFFu) |
        (((~(0u - (u ^ 43u)) & (62u << 8)) >> 8) & 0xFFu) |
        (((~(0u - (u ^ 47u)) & (63u << 8)) >> 8) & 0xFFu);

    return x | (((~(0u - x) & (0u - (u ^ 65u))) >> 8) & 0xFFu);
}


int main(){
    b64_char_to_byte(0);
}
