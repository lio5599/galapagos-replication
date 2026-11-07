#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Compute the original five terms and replace their OR with De Morgan's identity.
    // No range assumptions are made, and the resulting value remains at most 255.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int p = a & (x + 'A');
    unsigned int q = (a ^ 255U) & b & (x + ('a' - 26));
    unsigned int r = (b ^ 255U) & c & (x + ('0' - 52));
    unsigned int s = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    unsigned int t = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    return ~(~p & ~q & ~r & ~s & ~t);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
