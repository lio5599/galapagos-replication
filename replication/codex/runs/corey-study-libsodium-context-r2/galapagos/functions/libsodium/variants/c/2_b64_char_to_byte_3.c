#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int upper_bad = ((u - 'A') | ('Z' - u)) >> 8;
    const unsigned int lower_bad = ((u - 'a') | ('z' - u)) >> 8;
    const unsigned int digit_bad = ((u - '0') | ('9' - u)) >> 8;
    const unsigned int plus_bad = (0U - (u ^ '+')) >> 8;
    const unsigned int slash_bad = (0U - (u ^ '/')) >> 8;
    unsigned int x =
        ((u - 'A') & ~upper_bad) |
        ((u - ('a' - 26)) & ~lower_bad) |
        ((u - ('0' - 52)) & ~digit_bad);

    x = (x & 0xFFU) | (62U & ~plus_bad) | (63U & ~slash_bad);
    return x | (0xFFU & (((0U - (u ^ 'A')) >> 8) &
                         ~((0U - x) >> 8)));
}


int main(){
    b64_char_to_byte(0);
}
