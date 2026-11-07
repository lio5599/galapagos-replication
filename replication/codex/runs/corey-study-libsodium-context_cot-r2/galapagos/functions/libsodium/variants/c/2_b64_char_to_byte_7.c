#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Factoring out the common low-byte mask preserves all five contributions.
    // Bits above the low byte cannot affect bitwise OR or AND in the low byte.
    // The final correction uses the resulting bounded x, exactly as the reference.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = (~((u - 'A') | ('Z' - u)) >> 8) & (u - 'A');
    const unsigned int b = (~((u - 'a') | ('z' - u)) >> 8) & (u - 'a' + 26U);
    const unsigned int d = (~((u - '0') | ('9' - u)) >> 8) & (u - '0' + 52U);
    const unsigned int p = (~(0U - (u ^ '+')) >> 8) & 62U;
    const unsigned int q = (~(0U - (u ^ '/')) >> 8) & 63U;
    const unsigned int x = (a | b | d | p | q) & 255U;
    return x | (((~(0U - x) >> 8) &
                 ((0U - (u ^ 'A')) >> 8)) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
