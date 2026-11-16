#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Computes result using a single expression with nested ternaries.
// Maintains equivalence with reference for all valid inputs.
// Handles edge cases 62 and 63 explicitly.
{
    return x < 26 ? x + 'A' :
           x < 52 ? x - 26 + 'a' :
           x < 62 ? x - 52 + '0' :
           x == 62 ? '+' : '/';
}


int main(){
    b64_byte_to_char(0);
}
