#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Uses explicit conditional logic converted to branchless arithmetic.
    // Checks each base64 character range and computes offset.
    // Invalid characters yield 0 after final validity mask.
    // Equivalent because same ranges and offsets as reference.
    unsigned int val = 0;
    unsigned int in_upper = (((unsigned int)(c) >= 'A') & ((unsigned int)(c) <= 'Z'));
    unsigned int in_lower = (((unsigned int)(c) >= 'a') & ((unsigned int)(c) <= 'z'));
    unsigned int in_digit = (((unsigned int)(c) >= '0') & ((unsigned int)(c) <= '9'));
    unsigned int is_plus = ((unsigned int)(c) == '+');
    unsigned int is_slash = ((unsigned int)(c) == '/');
    val = (in_upper & (c - 'A')) | (in_lower & (c - 'a' + 26)) | (in_digit & (c - '0' + 52)) | (is_plus & 62) | (is_slash & 63);
    unsigned int valid = in_upper | in_lower | in_digit | is_plus | is_slash;
    return val & valid;
}


int main(){
    b64_char_to_byte(0);
}
