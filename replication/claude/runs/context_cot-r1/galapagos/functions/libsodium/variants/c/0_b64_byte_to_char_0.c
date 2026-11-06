#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Reference: maps a 6-bit value to its Base64 char (A-Z, a-z, 0-9, +, /) without branches.
    // Approach: compute each byte mask from the reference into its own local variable.
    // Each mask is bits 8..15 of a wrapped subtraction, exactly as in the reference.
    // The final OR of masked terms is unchanged, so every 32-bit input, large ones included, matches.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    return (int) ((a & (x + 65U)) | ((a ^ 0xFFU) & b & (x + 71U)) |
                  ((b ^ 0xFFU) & c & (x - 4U)) | (d & 43U) | (e & 47U));
}


int main(){
    b64_byte_to_char(0);
}
