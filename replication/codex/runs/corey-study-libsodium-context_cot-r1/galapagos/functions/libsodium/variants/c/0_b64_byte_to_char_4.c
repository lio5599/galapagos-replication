#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Remove selected bits using v XOR (v AND mask) instead of an inverted mask.
    // Each v is already byte-sized, so this equals the reference's byte masking.
    // The identity holds for arbitrary masks, not just zero and 255.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int v = b & (x + ('a' - 26));
    unsigned int w = c & (x + ('0' - 52));
    return (int)((a & (x + 'A')) |
                 (v ^ (v & a)) |
                 (w ^ (w & b)) |
                 (d & '+') |
                 (e & '/'));
}


int main(){
    b64_byte_to_char(0);
}
