#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Reference computes base64 char to 0-63 value using branchless range checks.
    // It maps A-Z to 0-25, a-z to 26-51, 0-9 to 52-61, + to 62, / to 63.
    // Invalid chars return 0 due to final masking with invalid flag.
    // Each term uses arithmetic tricks to create 0xFF if in range, 0 otherwise.
    // The final OR masks out result if c is not a valid base64 character.
    const unsigned int x =
        ((((((unsigned int) (c) - (unsigned int) ('A')) >> 8) & 0xFF) ^ 0xFF) & (((((unsigned int) ('Z') - (unsigned int) (c)) >> 8) & 0xFF) ^ 0xFF) & (c - 'A')) |
        ((((((unsigned int) (c) - (unsigned int) ('a')) >> 8) & 0xFF) ^ 0xFF) & (((((unsigned int) ('z') - (unsigned int) (c)) >> 8) & 0xFF) ^ 0xFF) & (c - ('a' - 26))) |
        ((((((unsigned int) (c) - (unsigned int) ('0')) >> 8) & 0xFF) ^ 0xFF) & (((((unsigned int) ('9') - (unsigned int) (c)) >> 8) & 0xFF) ^ 0xFF) & (c - ('0' - 52))) | (((((0U - ((unsigned int) (c) ^ (unsigned int) ('+'))) >> 8) & 0xFF) ^ 0xFF) & 62) |
        (((((0U - ((unsigned int) (c) ^ (unsigned int) ('/'))) >> 8) & 0xFF) ^ 0xFF) & 63);

    return x | (((((0U - ((unsigned int) (x) ^ (unsigned int) (0))) >> 8) & 0xFF) ^ 0xFF) & (((((0U - ((unsigned int) (c) ^ (unsigned int) ('A'))) >> 8) & 0xFF) ^ 0xFF) ^ 0xFF));
}


int main(){
    b64_char_to_byte(0);
}
