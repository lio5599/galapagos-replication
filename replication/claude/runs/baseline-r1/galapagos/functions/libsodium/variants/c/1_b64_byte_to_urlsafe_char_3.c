#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int result = 0U;
    unsigned int mask_lo = ((x - 26U) >> 8) & 0xFFU;
    unsigned int mask_mid = ((x - 52U) >> 8) & 0xFFU;
    unsigned int mask_hi = ((x - 62U) >> 8) & 0xFFU;

    result |= mask_lo & (x + 65U);
    result |= (mask_lo ^ 0xFFU) & mask_mid & (x + 71U);
    result |= (mask_mid ^ 0xFFU) & mask_hi & (x - 4U);
    result |= ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & 45U;
    result |= ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & 95U;
    return (int) result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
