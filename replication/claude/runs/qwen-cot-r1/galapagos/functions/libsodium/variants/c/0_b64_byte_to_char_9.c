#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Final variant with same arithmetic masking strategy
// Computes five mutually exclusive masks for the five output categories
// Mask A: x < 26, selects uppercase letter
// Mask B: 26 <= x < 52, selects lowercase letter
// Mask C: 52 <= x < 62, selects digit
// Mask D: x == 62, selects '+'
// Mask E: x == 63, selects '/'
// Each mask is 0xFF when active, 0x00 when inactive
// Results are combined with OR since masks are mutually exclusive
{
    unsigned int mA = ((x - 26) >> 8) & 0xFF;
    unsigned int mB = ((x - 52) >> 8) & 0xFF;
    unsigned int mC = ((x - 62) >> 8) & 0xFF;
    unsigned int mD = ((0U - (x ^ 62)) >> 8) & 0xFF;
    unsigned int mE = ((0U - (x ^ 63)) >> 8) & 0xFF;
    return (mA & (x + 'A')) | ((~mA & mB) & (x + 'a' - 26)) | ((~mB & mC) & (x + '0' - 52)) | ((~mD & 0xFF) & '+') | ((~mE & 0xFF) & '/');
}


int main(){
    b64_byte_to_char(0);
}
