#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int r = 0U;

    if (a != 0U)
        r |= a & (x + 'A');
    if ((a ^ 0xFFU) != 0U)
        r |= (a ^ 0xFFU) & b & (x + ('a' - 26));
    if ((b ^ 0xFFU) != 0U)
        r |= (b ^ 0xFFU) & c & (x + ('0' - 52));
    if (d != 0U)
        r |= d & '-';
    if (e != 0U)
        r |= e & '_';

    return (int)r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
