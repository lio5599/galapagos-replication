#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int differences[5] = {
        (u - 'A') | ('Z' - u),
        (u - 'a') | ('z' - u),
        (u - '0') | ('9' - u),
        0U - (u ^ '+'),
        0U - (u ^ '/')
    };
    const unsigned int values[5] = {
        u - 'A', u - 'a' + 26U, u - '0' + 52U, 62U, 63U
    };
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i)
        x |= ~(differences[i] >> 8) & values[i] & 255U;

    return x ? x : ((0U - (u ^ 'A')) >> 8) & 255U;
}


int main(){
    b64_char_to_byte(0);
}
