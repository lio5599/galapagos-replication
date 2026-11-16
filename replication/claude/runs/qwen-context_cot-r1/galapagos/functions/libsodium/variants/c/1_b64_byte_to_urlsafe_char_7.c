#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Nested ternary for compact branchless-like logic
    // Evaluates ranges from smallest to largest
    if (x >= 64) return 0;
    return (x < 26) ? ('A' + x) :
           (x < 52) ? ('a' + x - 26) :
           (x < 62) ? ('0' + x - 52) :
           (x == 62) ? '-' : '_';
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
