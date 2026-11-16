#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Uses bitwise tricks to select between ranges.
// Computes masks based on comparison results.
// Combines results using bitwise OR with masked values.
{
    unsigned int in_upper = (x < 26);
    unsigned int in_lower = (x >= 26) & (x < 52);
    unsigned int in_digit = (x >= 52) & (x < 62);
    unsigned int is_plus = (x == 62);
    unsigned int is_slash = (x == 63);
    int val_upper = x + 'A';
    int val_lower = x - 26 + 'a';
    int val_digit = x - 52 + '0';
    int val_plus = '+';
    int val_slash = '/';
    return (in_upper ? val_upper : 0) |
           (in_lower ? val_lower : 0) |
           (in_digit ? val_digit : 0) |
           (is_plus ? val_plus : 0) |
           (is_slash ? val_slash : 0);
}


int main(){
    b64_byte_to_char(0);
}
