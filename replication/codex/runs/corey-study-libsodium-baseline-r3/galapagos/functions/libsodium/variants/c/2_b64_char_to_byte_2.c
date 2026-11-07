#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int upper =
        (u - 'A') & ~(((u - 'A') | ('Z' - u)) >> 8);
    const unsigned int lower =
        (u - ('a' - 26)) & ~(((u - 'a') | ('z' - u)) >> 8);
    const unsigned int digit =
        (u - ('0' - 52)) & ~(((u - '0') | ('9' - u)) >> 8);
    const unsigned int plus =
        62U & ~((0U - (u ^ '+')) >> 8);
    const unsigned int slash =
        63U & ~((0U - (u ^ '/')) >> 8);
    const unsigned int x = (upper | lower | digit | plus | slash) & 255U;
    const unsigned int invalid = ((0U - (u ^ 'A')) >> 8) & 255U;

    return x | ((0U - (unsigned int)(x == 0U)) & invalid);
}


int main(){
    b64_char_to_byte(0);
}
