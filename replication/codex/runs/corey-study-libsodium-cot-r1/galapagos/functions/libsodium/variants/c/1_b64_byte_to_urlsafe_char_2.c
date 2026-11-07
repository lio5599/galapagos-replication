#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Form the five original contributions, then combine using De Morgan's law.
    // All contributions are bytes, so the final byte mask changes nothing.
    // Unsigned wraparound and partial masks remain intact for every input.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int p = a & (x + 'A');
    unsigned int q = (~a & 255U) & b & (x + ('a' - 26));
    unsigned int r = (~b & 255U) & c & (x + ('0' - 52));
    unsigned int s = (~((0U - (x ^ 62U)) >> 8) & 255U) & '-';
    unsigned int t = (~((0U - (x ^ 63U)) >> 8) & 255U) & '_';

    return (int)(~(~p & ~q & ~r & ~s & ~t) & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
