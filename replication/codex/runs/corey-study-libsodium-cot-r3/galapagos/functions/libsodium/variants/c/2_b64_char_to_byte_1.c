#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // De Morgan's law combines each pair of complemented range masks.
    // Masking the result to eight bits preserves the reference's exact bit values.
    // Punctuation retains its negated-XOR masks rather than ordinary comparisons.
    // The zero-result correction also preserves behavior for non-byte inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = u - (unsigned int)'A';
    const unsigned int b = u - (unsigned int)'a';
    const unsigned int d = u - (unsigned int)'0';
    unsigned int x =
        (~((a | ((unsigned int)'Z' - u)) >> 8) & a) |
        (~((b | ((unsigned int)'z' - u)) >> 8) & (b + 26U)) |
        (~((d | ((unsigned int)'9' - u)) >> 8) & (d + 52U));
    x &= 255U;
    x |= ~((0U - (u ^ (unsigned int)'+')) >> 8) & 62U;
    x |= ~((0U - (u ^ (unsigned int)'/')) >> 8) & 63U;

    if (x == 0U)
        x = ((0U - (u ^ (unsigned int)'A')) >> 8) & 255U;
    return x;
}


int main(){
    b64_char_to_byte(0);
}
