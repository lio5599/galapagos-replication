#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 0xFFU;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 0xFFU;
    unsigned int lower = b & (x + ('a' - 26));
    unsigned int digit = c & (x + ('0' - 52));
    unsigned int dash = 0xFFU & '-';
    unsigned int under = 0xFFU & '_';

    lower ^= lower & a;
    digit ^= digit & b;
    dash ^= dash & d;
    under ^= under & e;

    return (int)((a & (x + 'A')) | lower | digit | dash | under);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
