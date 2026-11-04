#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int m[3];
    unsigned int off[3];
    unsigned int r = 0;
    unsigned int prev = 0xFFU;
    int i;

    m[0] = ((x - 26U) >> 8) & 0xFFU;
    m[1] = ((x - 52U) >> 8) & 0xFFU;
    m[2] = ((x - 62U) >> 8) & 0xFFU;
    off[0] = x + 'A';
    off[1] = x + ('a' - 26);
    off[2] = x + ('0' - 52);

    for (i = 0; i < 3; i++) {
        r |= prev & m[i] & off[i];
        prev = m[i] ^ 0xFFU;
    }
    r |= ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & '+';
    r |= ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & '/';
    return (int) r;
}


int main(){
    b64_byte_to_char(0);
}
