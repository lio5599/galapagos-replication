#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Accumulate the five masked contributions using associative bitwise OR.
    // Every mask still examines bits 8 through 15 of the full unsigned input.
    // The original final correction is retained for all defined reference inputs.
    const unsigned int u = (unsigned int)c;
    unsigned int x = 0U;
    x |= ((~((u - 'A') | ('Z' - u)) >> 8) & 255U) & (u - 'A');
    x |= ((~((u - 'a') | ('z' - u)) >> 8) & 255U) & (u - 'a' + 26U);
    x |= ((~((u - '0') | ('9' - u)) >> 8) & 255U) & (u - '0' + 52U);
    x |= ((~(0U - (u ^ '+')) >> 8) & 255U) & 62U;
    x |= ((~(0U - (u ^ '/')) >> 8) & 255U) & 63U;
    return x | (((~(0U - x) >> 8) & 255U) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
