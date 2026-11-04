#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((~(u - 65U) >> 8) & (~(90U - u) >> 8) & 0xFFU & (u - 65U)) |
        ((~(u - 97U) >> 8) & (~(122U - u) >> 8) & 0xFFU & (u - 71U)) |
        ((~(u - 48U) >> 8) & (~(57U - u) >> 8) & 0xFFU & (u + 4U)) |
        ((((u ^ 43U) - 1U) >> 8) & 62U) |
        ((((u ^ 47U) - 1U) >> 8) & 63U);

    if (x != 0U) {
        return x;
    }
    return ((0U - (u ^ 65U)) >> 8) & 0xFFU;
}


int main(){
    b64_char_to_byte(0);
}
