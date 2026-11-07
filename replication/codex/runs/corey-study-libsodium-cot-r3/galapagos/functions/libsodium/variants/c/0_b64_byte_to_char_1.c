#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Only the low sixteen input bits can affect the reference's result.
    // Truncating first preserves subtraction, negation, and candidate low bytes.
    // Extracting masks with 0xFF00 therefore also preserves out-of-range inputs.
    unsigned int y = x & 65535U;
    unsigned int a = ((y - 26U) & 65280U) >> 8;
    unsigned int b = ((y - 52U) & 65280U) >> 8;
    unsigned int c = ((y - 62U) & 65280U) >> 8;
    unsigned int d = ((~(0U - (y ^ 62U))) & 65280U) >> 8;
    unsigned int e = ((~(0U - (y ^ 63U))) & 65280U) >> 8;

    return (int)((a & (y + 'A')) |
                 ((255U ^ a) & b & (y + ('a' - 26))) |
                 ((255U ^ b) & c & (y + ('0' - 52))) |
                 (d & '+') | (e & '/'));
}


int main(){
    b64_byte_to_char(0);
}
