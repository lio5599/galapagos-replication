#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int m1 = (unsigned int) (unsigned char) ((x - 26U) >> 8);
    unsigned int m2 = (unsigned int) (unsigned char) ((x - 52U) >> 8);
    unsigned int m3 = (unsigned int) (unsigned char) ((x - 62U) >> 8);
    unsigned int m4 = (unsigned int) (unsigned char) (~((0U - (x ^ 62U)) >> 8));
    unsigned int m5 = (unsigned int) (unsigned char) (~((0U - (x ^ 63U)) >> 8));
    unsigned int t1 = m1 & (x + 'A');
    unsigned int t2 = (m1 ^ 0xFFU) & m2 & (x + ('a' - 26));
    unsigned int t3 = (m2 ^ 0xFFU) & m3 & (x + ('0' - 52));
    unsigned int t4 = m4 & '-';
    unsigned int t5 = m5 & '_';
    return (int) (t1 | t2 | t3 | t4 | t5);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
