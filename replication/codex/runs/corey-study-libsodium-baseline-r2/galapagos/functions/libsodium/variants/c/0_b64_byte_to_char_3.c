#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int p = a & (x + 'A');
    unsigned int q = ~a & b & (x + ('a' - 26));
    unsigned int r = ~b & c & (x + ('0' - 52));
    unsigned int s = ~((0U - (x ^ 62U)) >> 8) & (unsigned int)'+';
    unsigned int t = ~((0U - (x ^ 63U)) >> 8) & (unsigned int)'/';

    return (int)((~(~p & ~q & ~r & ~s & ~t)) & 255U);
}


int main(){
    b64_byte_to_char(0);
}
