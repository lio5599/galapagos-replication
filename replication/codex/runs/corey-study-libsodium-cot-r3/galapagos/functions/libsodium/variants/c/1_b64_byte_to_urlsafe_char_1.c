#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Delay all byte truncation until the final result.
    // Bitwise operations act independently on each bit, so higher bits cannot interfere.
    // Complements match XOR with 255 in the retained byte, for every unsigned input.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int result = (a & (x + 'A')) |
                          (~a & b & (x + ('a' - 26))) |
                          (~b & c & (x + ('0' - 52))) |
                          (~d & '-') | (~e & '_');

    return (int)(result & 0xFFU);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
