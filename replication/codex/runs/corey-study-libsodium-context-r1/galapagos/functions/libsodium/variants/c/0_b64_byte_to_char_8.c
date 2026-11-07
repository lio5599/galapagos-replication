#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int upper = (x + 'A') & 0xFFU;
    unsigned int lower = (x + ('a' - 26)) & 0xFFU;
    unsigned int digit = (x + ('0' - 52)) & 0xFFU;
    unsigned int plus = (unsigned int)'+' & 0xFFU;
    unsigned int slash = (unsigned int)'/' & 0xFFU;
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;

    upper &= a;
    lower &= ~a & b;
    digit &= ~b & c;
    plus &= ~((0U - (x ^ 62U)) >> 8);
    slash &= ~((0U - (x ^ 63U)) >> 8);

    return (int)(upper | lower | digit | plus | slash);
}


int main(){
    b64_byte_to_char(0);
}
