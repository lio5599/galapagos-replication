#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Approach: use a plain if-ladder over the Base64 ranges when x is in 0..63.
    // For x < 26 the reference mask a is 0xFF and the other terms are 0, giving 'A'+x. Similarly,
    // 26..51 gives 'a'+x-26, 52..61 gives '0'+x-52, 62 gives '+', and 63 gives '/'.
    // For x >= 64, the reference's mask expression is evaluated unchanged, so out-of-range
    // inputs still return the reference's exact byte.
    if (x < 26U) return (int) ('A' + x);
    if (x < 52U) return (int) ('a' + (x - 26U));
    if (x < 62U) return (int) ('0' + (x - 52U));
    if (x == 62U) return '+';
    if (x == 63U) return '/';
    return (int) (((((x - 26U) >> 8) & 0xFFU) & (x + 65U)) |
                  (((((x - 26U) >> 8) & 0xFFU) ^ 0xFFU) & (((x - 52U) >> 8) & 0xFFU) & (x + 71U)) |
                  (((((x - 52U) >> 8) & 0xFFU) ^ 0xFFU) & (((x - 62U) >> 8) & 0xFFU) & (x - 4U)) |
                  (((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & 43U) |
                  (((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & 47U));
}


int main(){
    b64_byte_to_char(0);
}
