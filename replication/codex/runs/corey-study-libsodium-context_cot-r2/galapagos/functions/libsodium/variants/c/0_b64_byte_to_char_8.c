#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Postpone byte masking until after combining all terms.
    // Only the low eight bits can contribute in the reference.
    // Full complements have identical low bits to the reference's byte complements.
    // All arithmetic before extraction remains unsigned for wraparound inputs.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int result = (a & (x + 'A')) |
                          (~a & b & (x + ('a' - 26))) |
                          (~b & c & (x + ('0' - 52))) |
                          (~d & '+') |
                          (~e & '/');
    return result & 0xFFU;
}


int main(){
    b64_byte_to_char(0);
}
