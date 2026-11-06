#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // The result is accumulated term by term in a variable, using reference-style masks.
    // Each term is a byte: inverted bits 8..15 of both bounds, ANDed with the offset.
    // Unsigned offsets avoid signed overflow and match the reference where it is defined.
    // At the end, a nonzero x is returned unchanged (the reference's OR adds 0).
    // A zero x yields bits 8..15 of -(c^'A'), which is the reference's final term.
    const unsigned int u = (unsigned int) c;
    unsigned int x = 0u;
    x |= ((((u - 65u) >> 8) & 0xFFu) ^ 0xFFu) & ((((90u - u) >> 8) & 0xFFu) ^ 0xFFu) & (u - 65u);
    x |= ((((u - 97u) >> 8) & 0xFFu) ^ 0xFFu) & ((((122u - u) >> 8) & 0xFFu) ^ 0xFFu) & (u - 71u);
    x |= ((((u - 48u) >> 8) & 0xFFu) ^ 0xFFu) & ((((57u - u) >> 8) & 0xFFu) ^ 0xFFu) & (u + 4u);
    x |= ((((0u - (u ^ 43u)) >> 8) & 0xFFu) ^ 0xFFu) & 62u;
    x |= ((((0u - (u ^ 47u)) >> 8) & 0xFFu) ^ 0xFFu) & 63u;
    return (x == 0u) ? (((0u - (u ^ 65u)) >> 8) & 0xFFu) : x;
}


int main(){
    b64_char_to_byte(0);
}
