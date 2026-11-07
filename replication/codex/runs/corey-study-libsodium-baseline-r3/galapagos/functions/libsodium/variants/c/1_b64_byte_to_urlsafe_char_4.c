#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int terms[5];
    unsigned int result = 0U;
    unsigned int i;

    terms[0] = a & (x + 'A');
    terms[1] = ~a & b & (x + ('a' - 26));
    terms[2] = ~b & c & (x + ('0' - 52));
    terms[3] = ~((0U - (x ^ 62U)) >> 8) & '-';
    terms[4] = ~((0U - (x ^ 63U)) >> 8) & '_';

    for (i = 0U; i < 5U; ++i)
        result |= terms[i];

    return (int)(result & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
