#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Reduces only the character arithmetic's input to its low byte.
    // Each character expression is selected through an eight-bit mask.
    // Unsigned addition has the same low byte before and after this reduction.
    // Mask calculations still use the complete input, preserving all edge cases.
    unsigned int y = x & 255U;
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    return (a & (y + 'A')) |
           (~a & b & (y + ('a' - 26))) |
           (~b & c & (y + ('0' - 52))) |
           (d & '-') | (e & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
