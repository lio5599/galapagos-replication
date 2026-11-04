#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    const unsigned int up = ((~(u - 65U) >> 8) & 0xFFU) & ((~(90U - u) >> 8) & 0xFFU) & (u - 65U);
    const unsigned int lo = ((~(u - 97U) >> 8) & 0xFFU) & ((~(122U - u) >> 8) & 0xFFU) & (u - 71U);
    const unsigned int di = ((~(u - 48U) >> 8) & 0xFFU) & ((~(57U - u) >> 8) & 0xFFU) & (u + 4U);
    const unsigned int pl = ((~(0U - (u ^ 43U)) >> 8) & 0xFFU) & 62U;
    const unsigned int sl = ((~(0U - (u ^ 47U)) >> 8) & 0xFFU) & 63U;
    const unsigned int x = up | lo | di | pl | sl;
    const unsigned int z = (~(0U - x) >> 8) & 0xFFU;
    const unsigned int na = ((0U - (u ^ 65U)) >> 8) & 0xFFU;
    return x | (z & na);
}


int main(){
    b64_char_to_byte(0);
}
