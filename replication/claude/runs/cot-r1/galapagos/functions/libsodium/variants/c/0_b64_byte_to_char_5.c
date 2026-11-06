#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Approach: for valid input 0..63, index the Base64 alphabet string directly.
    // In that range the reference gives exactly one active term: A-Z, a-z, 0-9, '+', or '/'.
    // For x >= 64 the reference returns odd, mask-dependent bytes, which a table cannot reproduce.
    // That case falls back to the same mask arithmetic, so the result is identical for every unsigned x.
    unsigned int a, b, c, d, e;
    if (x < 64U)
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[x];
    a = ((x - 26U) >> 8) & 0xFFU;
    b = ((x - 52U) >> 8) & 0xFFU;
    c = ((x - 62U) >> 8) & 0xFFU;
    d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    return (int) ((a & (x + 65U)) | ((a ^ 0xFFU) & b & (x + 71U)) | ((b ^ 0xFFU) & c & (x - 4U)) |
                  (d & 43U) | (e & 47U));
}


int main(){
    b64_byte_to_char(0);
}
