#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int r;

    r = a & (x + 'A');
    r |= (0xFFU - a) & b & (x + ('a' - 26));
    r |= (0xFFU - b) & c & (x + ('0' - 52));
    r |= (0xFFU - (((0U - (x ^ 62U)) >> 8) & 0xFFU)) & '-';
    r |= (0xFFU - (((0U - (x ^ 63U)) >> 8) & 0xFFU)) & '_';

    return (int)r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
