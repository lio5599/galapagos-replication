#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Uses bitwise operations to simulate conditional assignment.
    // Each condition creates a mask that selects the value.
    // OR combines all possible values, AND with validity clears invalid.
    // Equivalent by same mask-based selection as reference.
    unsigned int uc = (unsigned int)c;
    unsigned int m1 = -(unsigned int)(uc >= 'A' && uc <= 'Z');
    unsigned int m2 = -(unsigned int)(uc >= 'a' && uc <= 'z');
    unsigned int m3 = -(unsigned int)(uc >= '0' && uc <= '9');
    unsigned int m4 = -(unsigned int)(uc == '+');
    unsigned int m5 = -(unsigned int)(uc == '/');
    unsigned int v1 = m1 & (uc - 'A');
    unsigned int v2 = m2 & (uc - 'a' + 26);
    unsigned int v3 = m3 & (uc - '0' + 52);
    unsigned int v4 = m4 & 62;
    unsigned int v5 = m5 & 63;
    unsigned int val = v1 | v2 | v3 | v4 | v5;
    unsigned int valid = m1 | m2 | m3 | m4 | m5;
    return val & valid;
}


int main(){
    b64_char_to_byte(0);
}
