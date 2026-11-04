#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    static const unsigned int lim[3] = { 26U, 52U, 62U };
    static const int add[3] = { 'A', 'a' - 26, '0' - 52 };
    static const unsigned int sym[2] = { 62U, 63U };
    static const unsigned int chr[2] = { '+', '/' };
    unsigned int r = 0U;
    unsigned int notprev = 0xFFU;
    unsigned int m;
    int i;

    for (i = 0; i < 3; i++) {
        m = ((x - lim[i]) >> 8) & 0xFFU;
        r |= notprev & m & (x + (unsigned int) add[i]);
        notprev = m ^ 0xFFU;
    }
    for (i = 0; i < 2; i++) {
        r |= ((((0U - (x ^ sym[i])) >> 8) & 0xFFU) ^ 0xFFU) & chr[i];
    }
    return (int) r;
}


int main(){
    b64_byte_to_char(0);
}
