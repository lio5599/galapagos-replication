#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int m26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int m52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int m62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int e62 = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e63 = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int r;

    r = (m26 & (x + 'A'));
    r |= ((m26 ^ 0xFFU) & m52 & (x + ('a' - 26)));
    r |= ((m52 ^ 0xFFU) & m62 & (x + ('0' - 52)));
    r |= (e62 & '+');
    r |= (e63 & '/');
    return (int) r;
}


int main(){
    b64_byte_to_char(0);
}
