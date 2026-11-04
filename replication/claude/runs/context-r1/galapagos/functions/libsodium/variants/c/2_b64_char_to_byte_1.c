#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((((64U - u) & (u - 91U)) >> 8) & 0xFFU & (u - 65U)) |
        ((((96U - u) & (u - 123U)) >> 8) & 0xFFU & (u - 71U)) |
        ((((47U - u) & (u - 58U)) >> 8) & 0xFFU & (u + 4U)) |
        ((((u ^ 43U) - 1U) >> 8) & 62U) |
        ((((u ^ 47U) - 1U) >> 8) & 63U);

    return x | (((x - 1U) >> 8) & ((0U - (u ^ 65U)) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
