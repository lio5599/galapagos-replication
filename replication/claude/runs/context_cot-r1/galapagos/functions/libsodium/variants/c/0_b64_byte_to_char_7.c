#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Reorder the AND and OR operands using commutativity, and keep the character constants.
    // 'A', 'a' - 26, '0' - 52, '+' and '/' are converted to unsigned exactly as in the reference.
    // Only the operand order changes, so the bitwise result is identical for every x.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = 0xFFU ^ (((0U - (62U ^ x)) >> 8) & 0xFFU);
    unsigned int e = 0xFFU ^ (((0U - (63U ^ x)) >> 8) & 0xFFU);
    return (int) (((unsigned int) '/' & e) | ((unsigned int) '+' & d) |
                  ((x + (unsigned int) ('0' - 52)) & c & (0xFFU ^ b)) |
                  ((x + (unsigned int) ('a' - 26)) & b & (0xFFU ^ a)) | ((x + (unsigned int) 'A') & a));
}


int main(){
    b64_byte_to_char(0);
}
