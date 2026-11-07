#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Accumulates the original terms using u OR v equals u + v - (u AND v).
    // Every term and accumulated union fits in eight bits, so the sums fit.
    // The identity handles overlapping masks for inputs outside 0..63 as well.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int r = a & (x + 'A');
    unsigned int t = (~a & b) & (x + ('a' - 26));
    r = r + t - (r & t);
    t = (~b & c) & (x + ('0' - 52));
    r = r + t - (r & t);
    t = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    r = r + t - (r & t);
    t = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    return r + t - (r & t);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
