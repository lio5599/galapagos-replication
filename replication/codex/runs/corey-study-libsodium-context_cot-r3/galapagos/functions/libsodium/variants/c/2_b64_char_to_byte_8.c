#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Delay the common byte truncation until after all five contributions are ORed.
    // Bitwise operations act independently on bits, so discarded high bits cannot matter.
    // Truncate x before computing its zero mask to preserve every edge case.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ~(((u - 'A') | ('Z' - u)) >> 8);
    const unsigned int b = ~(((u - 'a') | ('z' - u)) >> 8);
    const unsigned int d = ~(((u - '0') | ('9' - u)) >> 8);
    const unsigned int p = ~((0U - (u ^ '+')) >> 8);
    const unsigned int q = ~((0U - (u ^ '/')) >> 8);
    const unsigned int x = ((a & (u - 'A')) | (b & (u - ('a' - 26)))
                          | (d & (u - ('0' - 52))) | (p & 62U) | (q & 63U))
                         & 0xFFU;
    return x | (~((0U - x) >> 8)
              & ((0U - (u ^ 'A')) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
