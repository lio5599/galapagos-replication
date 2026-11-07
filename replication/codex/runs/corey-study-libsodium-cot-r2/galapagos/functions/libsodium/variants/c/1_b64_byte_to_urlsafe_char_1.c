#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Delay byte truncation until after combining the terms.
    // Full-width complements have the same low eight bits as the reference's byte complements.
    // Higher bits cannot affect lower bits, including for arbitrary unsigned inputs.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int r = (a & (x + 'A')) |
                     (~a & b & (x + ('a' - 26))) |
                     (~b & c & (x + ('0' - 52))) |
                     (~d & '-') |
                     (~e & '_');

    return (int)(r & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
