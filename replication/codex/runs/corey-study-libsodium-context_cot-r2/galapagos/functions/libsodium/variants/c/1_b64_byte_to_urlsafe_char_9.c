#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Perform the mask operations in bit positions eight through fifteen.
    // Shifting candidates left aligns their low byte with the reference mask byte.
    // A final shift and truncation recover precisely the original five contributions.
    // All shifts and wraparound arithmetic are unsigned, including for large inputs.
    unsigned int a = x - 26U;
    unsigned int b = x - 52U;
    unsigned int c = x - 62U;
    unsigned int d = 0U - (x ^ 62U);
    unsigned int e = 0U - (x ^ 63U);
    unsigned int result =
        (a & ((x + 'A') << 8)) |
        (~a & b & ((x + ('a' - 26)) << 8)) |
        (~b & c & ((x + ('0' - 52)) << 8)) |
        (~d & ((unsigned int)'-' << 8)) |
        (~e & ((unsigned int)'_' << 8));
    return (int)((result >> 8) & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
