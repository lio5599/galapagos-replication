#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Reference: maps 0-25 to 'A'-'Z', 26-51 to 'a'-'z', 52-61 to '0'-'9', 62 to '+', 63 to '/'
// Uses arithmetic masking to select ranges without branches
// Each term is non-zero only when x falls in its specific range
// The mask ((x-N)>>8)&0xFF is 0xFF when x<N and 0x00 when x>=N (for small x)
// This creates a branchless lookup table via arithmetic
{
    return (((((unsigned int) (x) - (unsigned int) (26)) >> 8) & 0xFF) & (x + 'A')) |
           ((((((unsigned int) (x) - (unsigned int) (26)) >> 8) & 0xFF) ^ 0xFF) & ((((unsigned int) (x) - (unsigned int) (52)) >> 8) & 0xFF) & (x + ('a' - 26))) |
           ((((((unsigned int) (x) - (unsigned int) (52)) >> 8) & 0xFF) ^ 0xFF) & ((((unsigned int) (x) - (unsigned int) (62)) >> 8) & 0xFF) & (x + ('0' - 52))) | (((((0U - ((unsigned int) (x) ^ (unsigned int) (62))) >> 8) & 0xFF) ^ 0xFF) & '+') |
           (((((0U - ((unsigned int) (x) ^ (unsigned int) (63))) >> 8) & 0xFF) ^ 0xFF) & '/');
}


int main(){
    b64_byte_to_char(0);
}
