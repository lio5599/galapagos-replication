#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int values[5] = {
        u - 'A', u - ('a' - 26), u - ('0' - 52), 62U, 63U
    };
    const unsigned int rejected[5] = {
        ((u - 'A') | ('Z' - u)) >> 8,
        ((u - 'a') | ('z' - u)) >> 8,
        ((u - '0') | ('9' - u)) >> 8,
        (0U - (u ^ '+')) >> 8,
        (0U - (u ^ '/')) >> 8
    };
    unsigned int x = 0U;
    unsigned int i = 5U;

    while (i != 0U) {
        --i;
        x |= values[i] & ~rejected[i];
    }

    x &= 255U;
    return x | ((unsigned int)(x == 0U) *
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
