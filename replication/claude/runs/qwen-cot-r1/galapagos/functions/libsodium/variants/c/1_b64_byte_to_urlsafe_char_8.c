#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
// Compact lookup using string literal.
// Indexes directly into constant string.
// Simple and efficient for valid inputs.
// Relies on C string indexing.
{
    return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"[x];
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
