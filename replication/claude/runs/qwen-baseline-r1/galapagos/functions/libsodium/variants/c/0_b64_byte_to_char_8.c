#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int mask26 = (x < 26) ? 0xFFFFFFFF : 0;
    unsigned int mask52 = (x < 52) ? 0xFFFFFFFF : 0;
    unsigned int mask62 = (x < 62) ? 0xFFFFFFFF : 0;
    unsigned int mask62eq = (x == 62) ? 0xFFFFFFFF : 0;
    unsigned int mask63eq = (x == 63) ? 0xFFFFFFFF : 0;
    
    unsigned int v1 = 'A' + x;
    unsigned int v2 = 'a' + x - 26;
    unsigned int v3 = '0' + x - 52;
    unsigned int v4 = '+';
    unsigned int v5 = '/';
    
    unsigned int r1 = mask26 & v1;
    unsigned int r2 = (~mask26) & mask52 & v2;
    unsigned int r3 = (~mask52) & mask62 & v3;
    unsigned int r4 = (~mask62) & mask62eq & v4;
    unsigned int r5 = (~mask62eq) & mask63eq & v5;
    
    return r1 | r2 | r3 | r4 | r5;
}


int main(){
    b64_byte_to_char(0);
}
