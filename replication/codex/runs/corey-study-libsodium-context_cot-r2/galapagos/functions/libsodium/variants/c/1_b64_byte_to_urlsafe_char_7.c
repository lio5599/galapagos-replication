#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Remove excluded bits by XORing each candidate with its masked subset.
    // For any masks, v XOR (m AND v) equals v AND NOT m.
    // Byte-limited candidates make this identical to the reference byte complements.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 255U;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 255U;
    unsigned int lower = b & (x + ('a' - 26));
    unsigned int digit = c & (x + ('0' - 52));
    unsigned int dash = (unsigned int)'-' & 255U;
    unsigned int underscore = (unsigned int)'_' & 255U;
    return (int)((a & (x + 'A')) |
                 (lower ^ (a & lower)) |
                 (digit ^ (b & digit)) |
                 (dash ^ (d & dash)) |
                 (underscore ^ (e & underscore)));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
