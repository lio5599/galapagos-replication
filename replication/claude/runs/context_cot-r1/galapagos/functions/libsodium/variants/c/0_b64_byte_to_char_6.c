#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Subtractions are written as additions of their two's-complement constants, e.g. x - 26 = x + 0xFFFFFFE6.
    // Likewise, x - 4 = x + 0xFFFFFFFC. Unsigned arithmetic wraps identically, so every mask is unchanged.
    // The terms and their OR are the same as in the reference, giving identical results for all x.
    unsigned int a = ((x + 0xFFFFFFE6U) >> 8) & 0xFFU;
    unsigned int b = ((x + 0xFFFFFFCCU) >> 8) & 0xFFU;
    unsigned int c = ((x + 0xFFFFFFC2U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    return (int) ((a & (x + 65U)) | ((a ^ 0xFFU) & b & (x + 71U)) |
                  ((b ^ 0xFFU) & c & (x + 0xFFFFFFFCU)) | (d & 43U) | (e & 47U));
}


int main(){
    b64_byte_to_char(0);
}
