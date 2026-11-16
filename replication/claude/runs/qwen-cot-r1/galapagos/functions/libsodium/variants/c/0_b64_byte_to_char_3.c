#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Uses conditional-like selection via arithmetic: if x<26 use 'A'+x, else if x<52 use 'a'+(x-26), etc.
// The key insight: (x-N)>>8 for unsigned 32-bit gives 0xFFFFFFFF when x<N (due to underflow/borrow)
// ANDing with 0xFF gives 0xFF for true, 0x00 for false
// XOR with 0xFF inverts the mask for "greater than or equal" conditions
// Equality checks use (0 - (x^N))>>8 which is 0xFF only when x==N
{
    unsigned int m_a = ((x - 26) >> 8) & 0xFF;
    unsigned int m_b = ((x - 52) >> 8) & 0xFF;
    unsigned int m_c = ((x - 62) >> 8) & 0xFF;
    unsigned int e62 = ((0U - (x ^ 62)) >> 8) & 0xFF;
    unsigned int e63 = ((0U - (x ^ 63)) >> 8) & 0xFF;
    return (m_a & (x + 'A')) | ((~m_a & m_b) & (x - 26 + 'a')) | ((~m_b & m_c) & (x - 52 + '0')) | ((~e62 & 0xFF) & '+') | ((~e63 & 0xFF) & '/');
}


int main(){
    b64_byte_to_char(0);
}
