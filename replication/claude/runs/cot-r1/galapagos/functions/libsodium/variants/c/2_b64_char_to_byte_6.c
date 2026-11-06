#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Case folding: f = w | 0x20 lands in 'a'..'z' exactly when w is an ASCII letter of either case.
    // Bit 0x20 of w then tells lowercase apart, which adds 26. If w > 0xFF, f also exceeds 'z', so it fails.
    // (w | 4) == '/' matches exactly '+' (0x2B) and '/' (0x2F); bit 2 of w picks 62 or 63.
    // The quirk region w >= 0xFF00 gives 63, or 62 when w == 0xFF2F. Everything else gives 0xFF.
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    const unsigned int f = w | 0x20U;
    if (w >= 0xFF00U) return w == 0xFF2FU ? 62U : 63U;
    if (f - 'a' < 26U) return (f - 'a') + ((w & 0x20U) ? 26U : 0U);
    if (w - '0' < 10U) return w + 4U;
    if ((w | 4U) == '/') return 62U + ((w >> 2) & 1U);
    return 0xFFU;
}


int main(){
    b64_char_to_byte(0);
}
