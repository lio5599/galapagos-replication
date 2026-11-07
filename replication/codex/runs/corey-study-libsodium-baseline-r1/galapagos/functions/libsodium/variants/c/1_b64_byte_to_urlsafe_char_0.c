#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 0xFFU;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 0xFFU;

    return (int)((a & (x + 'A')) |
                 ((a ^ 0xFFU) & b & (x + ('a' - 26))) |
                 ((b ^ 0xFFU) & c & (x + ('0' - 52))) |
                 ((d ^ 0xFFU) & '-') |
                 ((e ^ 0xFFU) & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
