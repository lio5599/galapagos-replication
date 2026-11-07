#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Factor the shared bits of the plus and slash payloads.
    // Since 63 is 62 OR 1, their contribution is 62 AND their union, plus slash bit 0.
    // This identity works even when the arithmetic masks are not Boolean masks.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ~(((u - 'A') | ('Z' - u)) >> 8) & 0xFFU;
    const unsigned int b = ~(((u - 'a') | ('z' - u)) >> 8) & 0xFFU;
    const unsigned int d = ~(((u - '0') | ('9' - u)) >> 8) & 0xFFU;
    const unsigned int p = ~((0U - (u ^ '+')) >> 8) & 0xFFU;
    const unsigned int q = ~((0U - (u ^ '/')) >> 8) & 0xFFU;
    const unsigned int x = (a & (u - 'A')) | (b & (u - ('a' - 26)))
                         | (d & (u - ('0' - 52)))
                         | ((p | q) & 62U) | (q & 1U);
    return x | (~((0U - x) >> 8)
              & ((0U - (u ^ 'A')) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
