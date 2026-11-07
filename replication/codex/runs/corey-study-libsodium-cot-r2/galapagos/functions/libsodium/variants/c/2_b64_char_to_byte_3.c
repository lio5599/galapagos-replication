#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // De Morgan's law combines each pair of range masks before shifting.
    // Every contribution is confined to eight bits, so x is at most 255.
    // The reference zero mask is therefore 255 exactly when x is zero.
    // Retaining the A mask preserves even non-byte reference-defined inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int upper =
        (~((u - 'A') | ('Z' - u)) >> 8) & 255U;
    const unsigned int lower =
        (~((u - 'a') | ('z' - u)) >> 8) & 255U;
    const unsigned int digit =
        (~((u - '0') | ('9' - u)) >> 8) & 255U;
    const unsigned int plus =
        (~(0U - (u ^ '+')) >> 8) & 255U;
    const unsigned int slash =
        (~(0U - (u ^ '/')) >> 8) & 255U;
    const unsigned int x =
        (upper & (u - 'A')) |
        (lower & (u - 'a' + 26U)) |
        (digit & (u - '0' + 52U)) |
        (plus & 62U) | (slash & 63U);
    if (x != 0U)
        return x;
    return ((0U - (u ^ 'A')) >> 8) & 255U;
}


int main(){
    b64_char_to_byte(0);
}
