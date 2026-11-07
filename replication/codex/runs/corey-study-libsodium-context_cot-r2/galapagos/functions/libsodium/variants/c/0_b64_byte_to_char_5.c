#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Remove excluded bits with XOR instead of intersecting complemented masks.
    // For byte-sized t, t XOR (m AND t) equals t AND the byte complement of m.
    // This identity holds for every mask value and preserves all unsigned edge cases.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 0xFFU;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 0xFFU;
    unsigned int q = b & (x + ('a' - 26));
    unsigned int r = c & (x + ('0' - 52));
    unsigned int plus = ((unsigned int) '+') & 0xFFU;
    unsigned int slash = ((unsigned int) '/') & 0xFFU;
    return (a & (x + 'A')) |
           (q ^ (a & q)) |
           (r ^ (b & r)) |
           (plus ^ (d & plus)) |
           (slash ^ (e & slash));
}


int main(){
    b64_byte_to_char(0);
}
