#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // For any byte m, 255 minus m equals its eight-bit complement.
    // Apply that identity to all inverted masks, including non-Boolean masks.
    // Thus out-of-range inputs retain exactly the reference's behavior.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 255U;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 255U;
    return (int)((a & (x + 'A')) |
                 ((255U - a) & b & (x + ('a' - 26))) |
                 ((255U - b) & c & (x + ('0' - 52))) |
                 ((255U - d) & (unsigned int)'+') |
                 ((255U - e) & (unsigned int)'/'));
}


int main(){
    b64_byte_to_char(0);
}
