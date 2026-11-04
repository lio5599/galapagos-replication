#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    unsigned int x;
    x  = (((64U - u) >> 8) & 0xFFU) & (((u - 91U) >> 8) & 0xFFU) & (u - 65U);
    x |= (((96U - u) >> 8) & 0xFFU) & (((u - 123U) >> 8) & 0xFFU) & (u - 71U);
    x |= (((47U - u) >> 8) & 0xFFU) & (((u - 58U) >> 8) & 0xFFU) & (u + 4U);
    x |= ((((u ^ 43U) - 1U) >> 8) & 0xFFU) & 62U;
    x |= ((((u ^ 47U) - 1U) >> 8) & 0xFFU) & 63U;
    return x | ((((x - 1U) >> 8) & 0xFFU) & (((0U - (u ^ 65U)) >> 8) & 0xFFU));
}


int main(){
    b64_char_to_byte(0);
}
