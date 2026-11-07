#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Extract each mask byte using unsigned division and remainder.
    // Division by 256 equals shifting right eight bits; remainder keeps the low byte.
    // Subtractions occur before extraction and wrap exactly as in the reference.
    unsigned int a = ((x - 26U) / 256U) % 256U;
    unsigned int b = ((x - 52U) / 256U) % 256U;
    unsigned int c = ((x - 62U) / 256U) % 256U;
    unsigned int d = ((0U - (x ^ 62U)) / 256U) % 256U;
    unsigned int e = ((0U - (x ^ 63U)) / 256U) % 256U;
    return (int)((a & (x + 'A')) |
                 ((a ^ 255U) & b & (x + ('a' - 26))) |
                 ((b ^ 255U) & c & (x + ('0' - 52))) |
                 ((d ^ 255U) & '-') |
                 ((e ^ 255U) & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
