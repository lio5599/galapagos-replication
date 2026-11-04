#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((~(u - 65U) >> 8) & (~(90U - u) >> 8) & 0xFFU & (u - 65U)) |
        ((~(u - 97U) >> 8) & (~(122U - u) >> 8) & 0xFFU & (u - 71U)) |
        ((~(u - 48U) >> 8) & (~(57U - u) >> 8) & 0xFFU & (u + 4U)) |
        ((~(0U - (u ^ 43U)) >> 8) & 62U) |
        ((~(0U - (u ^ 47U)) >> 8) & 63U);

    return x | ((~(0U - x) >> 8) & ((0U - (u ^ 65U)) >> 8) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
