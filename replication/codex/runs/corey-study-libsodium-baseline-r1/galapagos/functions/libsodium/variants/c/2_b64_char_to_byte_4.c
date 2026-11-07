#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    unsigned int a = u - 'A';
    unsigned int b = u - 'a';
    unsigned int d = u - '0';
    unsigned int x;

    a = a & ~((a | ('Z' - u)) >> 8);
    b = (b + 26U) & ~((b | ('z' - u)) >> 8);
    d = (d + 52U) & ~((d | ('9' - u)) >> 8);

    x = (a | b | d |
         (~((0U - (u ^ '+')) >> 8) & 62U) |
         (~((0U - (u ^ '/')) >> 8) & 63U)) & 255U;

    return x | ((0U - (unsigned int)(x == 0U)) &
                ((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
