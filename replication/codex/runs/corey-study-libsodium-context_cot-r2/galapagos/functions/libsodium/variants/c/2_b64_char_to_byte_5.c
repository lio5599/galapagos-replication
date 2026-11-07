#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // XOR with 0xFF00 complements precisely the bits later extracted by shifting.
    // Combining range operands with OR is equivalent to ANDing their complements.
    // No input truncation or ordinary character-range test changes edge behavior.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ((((u - 'A') | ('Z' - u)) ^ 0xFF00U) >> 8) & 255U;
    const unsigned int b = ((((u - 'a') | ('z' - u)) ^ 0xFF00U) >> 8) & 255U;
    const unsigned int d = ((((u - '0') | ('9' - u)) ^ 0xFF00U) >> 8) & 255U;
    const unsigned int p = (((0U - (u ^ '+')) ^ 0xFF00U) >> 8) & 255U;
    const unsigned int q = (((0U - (u ^ '/')) ^ 0xFF00U) >> 8) & 255U;
    const unsigned int x = (a & (u - 'A')) |
                           (b & (u - 'a' + 26U)) |
                           (d & (u - '0' + 52U)) |
                           (p & 62U) | (q & 63U);
    return x | (((((0U - x) ^ 0xFF00U) >> 8) & 255U) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
