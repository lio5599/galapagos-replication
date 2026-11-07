#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Factor out a final byte mask after combining the five contributions.
    // Masking distributes over OR, so the resulting x is exactly the original.
    // For x from zero through 255, the shifted x-minus-one detects only zero.
    // The retained A mask preserves non-byte cases wherever the reference is defined.
    const unsigned int u = (unsigned int)c;
    const unsigned int x = (
        ((~((u - 'A') | ('Z' - u)) >> 8) & (u - 'A')) |
        ((~((u - 'a') | ('z' - u)) >> 8) & (u - 'a' + 26U)) |
        ((~((u - '0') | ('9' - u)) >> 8) & (u - '0' + 52U)) |
        ((~(0U - (u ^ '+')) >> 8) & 62U) |
        ((~(0U - (u ^ '/')) >> 8) & 63U)
    ) & 255U;
    const unsigned int zero = ((x - 1U) >> 8) & 255U;
    const unsigned int not_a =
        ((0U - (u ^ 'A')) >> 8) & 255U;
    return x | (zero & not_a);
}


int main(){
    b64_char_to_byte(0);
}
