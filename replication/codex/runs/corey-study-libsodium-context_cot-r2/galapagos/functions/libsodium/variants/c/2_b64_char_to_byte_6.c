#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Within eight bits, complementing v is equivalent to subtracting v from 255.
    // Each extracted value is bounded before subtraction, so the identity is exact.
    // Unsigned offsets preserve every input for which the reference is defined.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = 255U - ((((u - 'A') | ('Z' - u)) >> 8) & 255U);
    const unsigned int b = 255U - ((((u - 'a') | ('z' - u)) >> 8) & 255U);
    const unsigned int d = 255U - ((((u - '0') | ('9' - u)) >> 8) & 255U);
    const unsigned int p = 255U - (((0U - (u ^ '+')) >> 8) & 255U);
    const unsigned int q = 255U - (((0U - (u ^ '/')) >> 8) & 255U);
    const unsigned int x = (a & (u - 'A')) |
                           (b & (u - 'a' + 26U)) |
                           (d & (u - '0' + 52U)) |
                           (p & 62U) | (q & 63U);
    return x | ((255U - (((0U - x) >> 8) & 255U)) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
