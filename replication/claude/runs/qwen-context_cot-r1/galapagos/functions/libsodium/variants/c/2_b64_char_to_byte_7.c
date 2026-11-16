#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
// Uses arithmetic to determine validity and value.
// Calculates potential value for each group, masked by validity.
// Validity is determined by checking if c is within the character range.
// Equivalent because masks ensure only one group contributes.
{
    unsigned int u = (unsigned int)c;
    unsigned int val = 0;
    unsigned int mask_upper = ((u >= 'A') & (u <= 'Z')) ? 0xFFFFFFFF : 0;
    unsigned int mask_lower = ((u >= 'a') & (u <= 'z')) ? 0xFFFFFFFF : 0;
    unsigned int mask_digit = ((u >= '0') & (u <= '9')) ? 0xFFFFFFFF : 0;
    unsigned int mask_plus  = (u == '+') ? 0xFFFFFFFF : 0;
    unsigned int mask_slash = (u == '/') ? 0xFFFFFFFF : 0;
    
    val |= mask_upper & (u - 'A');
    val |= mask_lower & (u - 'a' + 26);
    val |= mask_digit & (u - '0' + 52);
    val |= mask_plus & 62;
    val |= mask_slash & 63;
    return val;
}


int main(){
    b64_char_to_byte(0);
}
