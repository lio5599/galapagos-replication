#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Unsigned division by 256 equals a right shift by eight.
    // Remainder modulo 256 extracts exactly the low eight bits.
    // Subtractions still wrap before division, preserving all edge cases.
    unsigned int a = ((x - 26U) / 256U) % 256U;
    unsigned int b = ((x - 52U) / 256U) % 256U;
    unsigned int c = ((x - 62U) / 256U) % 256U;
    unsigned int d = (((0U - (x ^ 62U)) / 256U) % 256U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) / 256U) % 256U) ^ 255U;
    return (int)((a & (x + 'A')) |
                 ((a ^ 255U) & b & (x + ('a' - 26))) |
                 ((b ^ 255U) & c & (x + ('0' - 52))) |
                 (d & '+') |
                 (e & '/'));
}


int main(){
    b64_byte_to_char(0);
}
