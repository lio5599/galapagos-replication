#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Form inverted masks with unsigned NOT followed by eight-bit truncation.
    // Rearranged character offsets use the same modular unsigned arithmetic, including wraparound.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int na = (~((x - 26U) >> 8)) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int nb = (~((x - 52U) >> 8)) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (~((0U - (x ^ 62U)) >> 8)) & 255U;
    unsigned int e = (~((0U - (x ^ 63U)) >> 8)) & 255U;
    return (a & (x + 'A')) |
           (na & b & (x + (unsigned int) 'a' - 26U)) |
           (nb & c & (x + (unsigned int) '0' - 52U)) |
           (d & '-') |
           (e & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
