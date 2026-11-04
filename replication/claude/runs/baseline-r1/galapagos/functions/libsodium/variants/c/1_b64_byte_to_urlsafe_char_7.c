#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int lt[3];
    unsigned int eq[2];
    unsigned int r;

    lt[0] = ((x - 26U) >> 8) & 0xFFU;
    lt[1] = ((x - 52U) >> 8) & 0xFFU;
    lt[2] = ((x - 62U) >> 8) & 0xFFU;
    eq[0] = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    eq[1] = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;

    r = lt[0] & (x + 'A');
    r |= (lt[0] ^ 0xFFU) & lt[1] & (x + ('a' - 26));
    r |= (lt[1] ^ 0xFFU) & lt[2] & (x + ('0' - 52));
    r |= eq[0] & '-';
    r |= eq[1] & '_';
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
