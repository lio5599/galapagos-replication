#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Apply De Morgan's law to the OR of the five masked terms.
    // Final byte masking makes full-width complements match byte complements.
    // Original unsigned subtractions preserve all boundary and large-input cases.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int va = x + 'A';
    unsigned int vb = x + ('a' - 26);
    unsigned int vc = x + ('0' - 52);

    return (int)(255U & ~((~a | ~va) &
                          (a | ~b | ~vb) &
                          (b | ~c | ~vc) &
                          (~d | ~(unsigned int)'+') &
                          (~e | ~(unsigned int)'/')));
}


int main(){
    b64_byte_to_char(0);
}
