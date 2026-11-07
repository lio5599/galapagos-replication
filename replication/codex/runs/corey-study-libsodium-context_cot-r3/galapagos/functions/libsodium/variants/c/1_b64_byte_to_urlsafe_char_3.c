#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Forms the five original terms, then combines them using De Morgan's law.
    // Complementing the intersection of complements equals their union.
    // Each term preserves the reference's masks even outside the Base64 range.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int p = a & (x + 'A');
    unsigned int q = (~a & b) & (x + ('a' - 26));
    unsigned int r = (~b & c) & (x + ('0' - 52));
    unsigned int s = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    unsigned int t = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    return ~(~p & ~q & ~r & ~s & ~t);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
