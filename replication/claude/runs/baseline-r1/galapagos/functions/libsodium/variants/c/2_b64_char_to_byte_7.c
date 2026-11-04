#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int) c;
    const unsigned int x =
        ((((63U - u + 1U) >> 8) & ((u - 90U - 1U) >> 8) & 0xFFU) & (u - 65U)) |
        ((((95U - u + 1U) >> 8) & ((u - 122U - 1U) >> 8) & 0xFFU) & (u - 71U)) |
        ((((46U - u + 1U) >> 8) & ((u - 57U - 1U) >> 8) & 0xFFU) & (u + 4U)) |
        (((((u ^ 43U) + 0xFFFFFFFFU) >> 8) & 0xFFU) & 62U) |
        (((((u ^ 47U) + 0xFFFFFFFFU) >> 8) & 0xFFU) & 63U);
    const unsigned int z = ((x + 0xFFFFFFFFU) >> 8) & 0xFFU;
    const unsigned int n = (((~(u ^ 65U)) + 1U) >> 8) & 0xFFU;
    return x | (z & n);
}


int main(){
    b64_char_to_byte(0);
}
