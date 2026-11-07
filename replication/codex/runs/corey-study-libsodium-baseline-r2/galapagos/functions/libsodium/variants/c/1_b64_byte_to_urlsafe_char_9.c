#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int upper = x + 'A';
    unsigned int lower = x + ('a' - 26);
    unsigned int digit = x + ('0' - 52);
    unsigned int dash = '-';
    unsigned int underscore = '_';

    upper &= a;
    lower &= b;
    lower ^= lower & a;
    digit &= c;
    digit ^= digit & b;
    dash ^= dash & d;
    underscore ^= underscore & e;

    return (int)((upper | lower | digit | dash | underscore) & 0xFFU);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
