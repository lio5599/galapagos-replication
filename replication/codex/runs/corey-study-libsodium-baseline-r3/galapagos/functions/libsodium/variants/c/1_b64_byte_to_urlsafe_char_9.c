#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int rejected = 255U;

    rejected &= ~(a & (x + 'A'));
    rejected &= ~(~a & b & (x + ('a' - 26)));
    rejected &= ~(~b & c & (x + ('0' - 52)));
    rejected &= ~(
        ~((0U - (x ^ 62U)) >> 8) & (unsigned int)'-');
    rejected &= ~(
        ~((0U - (x ^ 63U)) >> 8) & (unsigned int)'_');

    return (int)(rejected ^ 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
