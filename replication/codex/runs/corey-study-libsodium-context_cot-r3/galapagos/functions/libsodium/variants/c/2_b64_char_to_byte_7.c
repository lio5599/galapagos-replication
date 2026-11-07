#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Byte masking bounds x to zero through 255.
    // Within that range, the selected byte of x minus one is the exact zero mask.
    // The c-dependent correction remains unchanged, including for out-of-byte inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ~(((u - 'A') | ('Z' - u)) >> 8) & 0xFFU;
    const unsigned int b = ~(((u - 'a') | ('z' - u)) >> 8) & 0xFFU;
    const unsigned int d = ~(((u - '0') | ('9' - u)) >> 8) & 0xFFU;
    const unsigned int p = ~((0U - (u ^ '+')) >> 8) & 0xFFU;
    const unsigned int q = ~((0U - (u ^ '/')) >> 8) & 0xFFU;
    const unsigned int x = (a & (u - 'A')) | (b & (u - ('a' - 26)))
                         | (d & (u - ('0' - 52))) | (p & 62U) | (q & 63U);
    return x | (((x - 1U) >> 8)
              & ((0U - (u ^ 'A')) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
