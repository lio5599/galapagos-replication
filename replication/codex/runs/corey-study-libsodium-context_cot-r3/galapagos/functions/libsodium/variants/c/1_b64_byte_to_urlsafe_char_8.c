#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Extracts bits 8..15 by masking before shifting rather than afterward.
    // For unsigned values, (v >> 8) AND 255 equals (v AND 65280) >> 8.
    // This leaves every reference mask unchanged for every possible input.
    unsigned int a = ((x - 26U) & 65280U) >> 8;
    unsigned int b = ((x - 52U) & 65280U) >> 8;
    unsigned int c = ((x - 62U) & 65280U) >> 8;
    unsigned int d = (((0U - (x ^ 62U)) & 65280U) >> 8) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) & 65280U) >> 8) ^ 255U;
    return (a & (x + 'A')) |
           ((a ^ 255U) & b & (x + ('a' - 26))) |
           ((b ^ 255U) & c & (x + ('0' - 52))) |
           (d & '-') | (e & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
