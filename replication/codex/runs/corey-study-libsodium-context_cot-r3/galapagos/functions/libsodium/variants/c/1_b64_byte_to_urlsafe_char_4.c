#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Accumulates terms with the identity u OR v equals u XOR v XOR (u AND v).
    // This identity allows overlapping masks and does not assume a valid sextet.
    // Every term uses the same unsigned arithmetic as the reference.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int r = a & (x + 'A');
    unsigned int t = (~a & b) & (x + ('a' - 26));
    r = r ^ t ^ (r & t);
    t = (~b & c) & (x + ('0' - 52));
    r = r ^ t ^ (r & t);
    t = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    r = r ^ t ^ (r & t);
    t = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    return r ^ t ^ (r & t);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
