#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Complementing before an unsigned shift preserves the selected eight bits.
    // Range-mask intersections are moved before the common shift.
    // All arithmetic remains unsigned, preserving every defined reference result.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ((~(u - 'A') & ~('Z' - u)) >> 8) & 0xFFU;
    const unsigned int b = ((~(u - 'a') & ~('z' - u)) >> 8) & 0xFFU;
    const unsigned int d = ((~(u - '0') & ~('9' - u)) >> 8) & 0xFFU;
    const unsigned int p = (~(0U - (u ^ '+')) >> 8) & 0xFFU;
    const unsigned int q = (~(0U - (u ^ '/')) >> 8) & 0xFFU;
    const unsigned int x = (a & (u - 'A')) | (b & (u - ('a' - 26)))
                         | (d & (u - ('0' - 52))) | (p & 62U) | (q & 63U);
    return x | (((~(0U - x) & (0U - (u ^ 'A'))) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
