#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int u = (unsigned int)c;
    unsigned int a = u - 'A';
    unsigned int b = u - 'a';
    unsigned int d = u - '0';
    unsigned int x = 0U;

    x |= a & ~((a | ('Z' - u)) >> 8) & 255U;
    x |= (b + 26U) & ~((b | ('z' - u)) >> 8) & 255U;
    x |= (d + 52U) & ~((d | ('9' - u)) >> 8) & 255U;
    x |= 62U & ~((0U - (u ^ '+')) >> 8);
    x |= 63U & ~((0U - (u ^ '/')) >> 8);

    if (x != 0U)
        return x;
    return ((0U - (u ^ 'A')) >> 8) & 255U;
}


int main(){
    b64_char_to_byte(0);
}
