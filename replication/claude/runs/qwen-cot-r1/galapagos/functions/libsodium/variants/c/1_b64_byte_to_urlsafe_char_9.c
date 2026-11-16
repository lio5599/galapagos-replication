#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
// Uses arithmetic to compute base and offset.
// Determines character class via division-like logic.
// Adds appropriate ASCII base value.
// Handles special cases for '-' and '_'.
{
    if (x < 26) return 'A' + x;
    if (x < 52) return 'a' + x - 26;
    if (x < 62) return '0' + x - 52;
    return (x == 62) ? '-' : '_';
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
