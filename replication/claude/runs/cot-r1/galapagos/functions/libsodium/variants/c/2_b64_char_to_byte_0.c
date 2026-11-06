#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Reference: decodes one Base64 character to its 6-bit value, or returns 0xFF if it is not valid.
    // Its masks look only at bits 0..15 of c, so we work on w = c & 0xFFFF and use plain range checks.
    // 'A'..'Z' -> 0..25, 'a'..'z' -> 26..51, '0'..'9' -> 52..61, '+' -> 62, '/' -> 63. 'A' returns 0, not 0xFF.
    // Quirk: the reference's equality masks also fire when bits 8..15 are all ones.
    // So any w >= 0xFF00 returns 63, or 62 when the low byte is '/'. All other inputs return 0xFF.
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    if (w >= 'A' && w <= 'Z') return w - 'A';
    if (w >= 'a' && w <= 'z') return w - ('a' - 26);
    if (w >= '0' && w <= '9') return w + (52 - '0');
    if (w == '+') return 62U;
    if (w == '/') return 63U;
    if ((w >> 8) == 0xFFU) return (w & 0xFFU) == '/' ? 62U : 63U;
    return 0xFFU;
}


int main(){
    b64_char_to_byte(0);
}
