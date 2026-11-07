#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int ua = u - 'A';
    const unsigned int la = u - 'a';
    const unsigned int da = u - '0';
    unsigned int upper = ua & 0xFFU;
    unsigned int lower = (la + 26U) & 0xFFU;
    unsigned int digit = (da + 52U) & 0xFFU;
    unsigned int x;
    unsigned int correction;

    upper &= ~(ua >> 8);
    upper &= ~(('Z' - u) >> 8);
    lower &= ~(la >> 8);
    lower &= ~(('z' - u) >> 8);
    digit &= ~(da >> 8);
    digit &= ~(('9' - u) >> 8);

    x = upper | lower | digit;
    x |= ~((0U - (u ^ '+')) >> 8) & 62U;
    x |= ~((0U - (u ^ '/')) >> 8) & 63U;

    correction = ((0U - (u ^ 'A')) >> 8) & 0xFFU;
    correction &= ~((0U - x) >> 8);
    return x | correction;
}


int main(){
    b64_char_to_byte(0);
}
