#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int m26 = ((x - 26U) & 0xFF00U) >> 8;
    unsigned int m52 = ((x - 52U) & 0xFF00U) >> 8;
    unsigned int m62 = ((x - 62U) & 0xFF00U) >> 8;
    unsigned int e62 = (((0U - (x ^ 62U)) & 0xFF00U) >> 8) ^ 0xFFU;
    unsigned int e63 = (((0U - (x ^ 63U)) & 0xFF00U) >> 8) ^ 0xFFU;
    unsigned int r = 0U;
    r |= m26 & (x + 'A');
    r |= (m26 ^ 0xFFU) & m52 & (x + ('a' - 26));
    r |= (m52 ^ 0xFFU) & m62 & (x + ('0' - 52));
    r |= e62 & '-';
    r |= e63 & '_';
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
