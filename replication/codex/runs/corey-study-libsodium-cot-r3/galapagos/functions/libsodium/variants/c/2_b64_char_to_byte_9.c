#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Compute explicit contribution bytes, then reduce them in a balanced OR tree.
    // Complementing before the unsigned shift gives the same low mask byte.
    // The original negated-XOR zero mask supplies the final correction unchanged.
    // No character classification assumptions are used, preserving non-byte cases.
    const unsigned int u = (unsigned int)c;
    const unsigned int a =
        ((~(u - (unsigned int)'A') >> 8) &
         (~((unsigned int)'Z' - u) >> 8) &
         (u - (unsigned int)'A')) & 255U;
    const unsigned int b =
        ((~(u - (unsigned int)'a') >> 8) &
         (~((unsigned int)'z' - u) >> 8) &
         (u - ((unsigned int)'a' - 26U))) & 255U;
    const unsigned int d =
        ((~(u - (unsigned int)'0') >> 8) &
         (~((unsigned int)'9' - u) >> 8) &
         (u - ((unsigned int)'0' - 52U))) & 255U;
    const unsigned int p =
        (~(0U - (u ^ (unsigned int)'+')) >> 8) & 62U;
    const unsigned int s =
        (~(0U - (u ^ (unsigned int)'/')) >> 8) & 63U;
    const unsigned int x = (a | b) | (d | (p | s));
    const unsigned int zero_mask = ~((0U - x) >> 8) & 255U;
    const unsigned int correction =
        ((0U - (u ^ (unsigned int)'A')) >> 8) & 255U;

    return x | (zero_mask & correction);
}


int main(){
    b64_char_to_byte(0);
}
