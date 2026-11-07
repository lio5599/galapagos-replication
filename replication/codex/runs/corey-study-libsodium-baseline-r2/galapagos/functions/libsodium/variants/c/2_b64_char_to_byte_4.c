#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    unsigned int x;
    unsigned int mask;

    mask = ~(((u - 'A') | ('Z' - u)) >> 8) & 255U;
    x = mask & (u - 'A');

    mask = ~(((u - 'a') | ('z' - u)) >> 8) & 255U;
    x |= mask & (u - ('a' - 26));

    mask = ~(((u - '0') | ('9' - u)) >> 8) & 255U;
    x |= mask & (u - ('0' - 52));

    mask = ~((0U - (u ^ '+')) >> 8);
    x |= mask & 62U;

    mask = ~((0U - (u ^ '/')) >> 8);
    x |= mask & 63U;

    return x | ((0U - (unsigned int)(x == 0U))
              & ((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
