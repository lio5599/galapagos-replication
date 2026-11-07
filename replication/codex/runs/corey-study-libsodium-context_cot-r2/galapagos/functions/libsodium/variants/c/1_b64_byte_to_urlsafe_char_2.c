#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Delay all eight-bit truncation until the final result.
    // Bitwise operations act independently on each bit, so discarded high bits cannot interfere.
    // In the low eight bits, full complement equals the reference XOR with 255.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int result = (a & (x + 'A')) |
                          (~a & b & (x + ('a' - 26))) |
                          (~b & c & (x + ('0' - 52))) |
                          (~d & (unsigned int)'-') |
                          (~e & (unsigned int)'_');
    return (int)(result & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
