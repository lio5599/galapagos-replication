#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int m26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int m52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int m62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int e62 = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e63 = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int t1 = m26 & (x + 65U);
    unsigned int t2 = ~m26 & m52 & (x + 71U);
    unsigned int t3 = ~m52 & m62 & (x - 4U);
    unsigned int t4 = e62 & 43U;
    unsigned int t5 = e63 & 47U;
    return (int) ~(~t1 & ~t2 & ~t3 & ~t4 & ~t5);
}


int main(){
    b64_byte_to_char(0);
}
