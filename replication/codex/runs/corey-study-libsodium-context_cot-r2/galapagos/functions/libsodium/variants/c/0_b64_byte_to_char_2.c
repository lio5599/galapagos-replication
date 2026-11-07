#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Compute complemented byte masks by complementing before masking.
    // Complement and byte extraction commute, giving the original XOR masks.
    // Unsigned arithmetic and all five OR terms are preserved for edge inputs.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int na = (~((x - 26U) >> 8)) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int nb = (~((x - 52U) >> 8)) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int nd = (~((0U - (x ^ 62U)) >> 8)) & 0xFFU;
    unsigned int ne = (~((0U - (x ^ 63U)) >> 8)) & 0xFFU;
    return (a & (x + 'A')) |
           (na & b & (x + ('a' - 26))) |
           (nb & c & (x + ('0' - 52))) |
           (nd & '+') | (ne & '/');
}


int main(){
    b64_byte_to_char(0);
}
