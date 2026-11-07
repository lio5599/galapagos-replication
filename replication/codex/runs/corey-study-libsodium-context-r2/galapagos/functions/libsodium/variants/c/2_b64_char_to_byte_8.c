#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    unsigned int rejected = ~0U;
    unsigned int x;
    unsigned int correction;

    rejected &= ~((u - 'A') &
                  ~(((u - 'A') | ('Z' - u)) >> 8) & 0xFFU);
    rejected &= ~((u - ('a' - 26)) &
                  ~(((u - 'a') | ('z' - u)) >> 8) & 0xFFU);
    rejected &= ~((u - ('0' - 52)) &
                  ~(((u - '0') | ('9' - u)) >> 8) & 0xFFU);
    rejected &= ~(62U & ~((0U - (u ^ '+')) >> 8));
    rejected &= ~(63U & ~((0U - (u ^ '/')) >> 8));

    x = ~rejected;
    correction = ~((0U - x) >> 8) &
                 ((0U - (u ^ 'A')) >> 8) & 0xFFU;
    return ~(rejected & ~correction);
}


int main(){
    b64_char_to_byte(0);
}
