#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int p = a & (x + 'A');
    unsigned int q = (~a & b) & (x + ('a' - 26));
    unsigned int r = (~b & c) & (x + ('0' - 52));
    unsigned int s = (~((0U - (x ^ 62U)) >> 8) & 0xFFU) & '-';
    unsigned int t = (~((0U - (x ^ 63U)) >> 8) & 0xFFU) & '_';

    return ~(~p & ~q & ~r & ~s & ~t);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
