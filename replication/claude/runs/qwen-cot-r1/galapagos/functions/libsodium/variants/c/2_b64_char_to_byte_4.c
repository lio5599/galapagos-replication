#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Branchless using comparison masks.
    // Computes range membership via subtraction and sign bit.
    // Masks out invalid results at the end.
    // Equivalent to reference but with clearer mask construction.
    unsigned int uc = (unsigned int)c;
    unsigned int mask_A = (((uc >= 'A') & (uc <= 'Z')) ? 0xFFFFFFFF : 0);
    unsigned int mask_a = (((uc >= 'a') & (uc <= 'z')) ? 0xFFFFFFFF : 0);
    unsigned int mask_0 = (((uc >= '0') & (uc <= '9')) ? 0xFFFFFFFF : 0);
    unsigned int mask_p = (uc == '+');
    unsigned int mask_s = (uc == '/');
    unsigned int val = (mask_A & (uc - 'A')) | (mask_a & (uc - 'a' + 26)) | (mask_0 & (uc - '0' + 52)) | (mask_p & 62) | (mask_s & 63);
    unsigned int valid = mask_A | mask_a | mask_0 | mask_p | mask_s;
    return val & valid;
}


int main(){
    b64_char_to_byte(0);
}
