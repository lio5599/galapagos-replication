#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Unsigned wrap-around trick: (w - lo) < n holds exactly when lo <= w < lo + n, since a smaller w wraps huge.
    // w is the low 16 bits of c, which are the only bits the reference inspects.
    // Each class returns its offset, and '+' and '/' map to 62 and 63.
    // w >= 0xFF00 mirrors the reference quirk: 62 only for 0xFF2F, otherwise 63. All else returns 0xFF.
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    if (w - 'A' < 26U) return w - 'A';
    if (w - 'a' < 26U) return w - 'a' + 26U;
    if (w - '0' < 10U) return w - '0' + 52U;
    if (w == '+') return 62U;
    if (w == '/') return 63U;
    if (w >= 0xFF00U) return w == 0xFF2FU ? 62U : 63U;
    return 0xFFU;
}


int main(){
    b64_char_to_byte(0);
}
