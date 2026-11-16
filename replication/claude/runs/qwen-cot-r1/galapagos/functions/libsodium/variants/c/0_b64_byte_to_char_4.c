#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Equivalent to reference but with reordered terms for clarity
// First term handles 0-25 mapping to uppercase letters
// Second term handles 26-51 mapping to lowercase letters
// Third term handles 52-61 mapping to digits
// Fourth term handles exactly 62 mapping to '+'
// Fifth term handles exactly 63 mapping to '/'
// All terms use bitwise AND to zero out non-applicable ranges
{
    unsigned int mask1 = ((x - 26) >> 8) & 0xFF;
    unsigned int mask2 = ((x - 52) >> 8) & 0xFF;
    unsigned int mask3 = ((x - 62) >> 8) & 0xFF;
    unsigned int eq62 = ((0U - (x ^ 62)) >> 8) & 0xFF;
    unsigned int eq63 = ((0U - (x ^ 63)) >> 8) & 0xFF;
    return (mask1 & (x + 'A')) | ((~mask1 & mask2) & (x + 'a' - 26)) | ((~mask2 & mask3) & (x + '0' - 52)) | ((~eq62 & 0xFF) & '+') | ((~eq63 & 0xFF) & '/');
}


int main(){
    b64_byte_to_char(0);
}
