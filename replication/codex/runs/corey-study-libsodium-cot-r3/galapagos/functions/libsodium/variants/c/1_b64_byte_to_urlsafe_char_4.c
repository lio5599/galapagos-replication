#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Store the five masks and candidate values in parallel arrays.
    // OR-reducing their intersections is exactly the reference expression.
    // No range assumption is made, so unsigned wraparound and partial masks remain.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int masks[5] = {
        a,
        (255U ^ a) & b,
        (255U ^ b) & (((x - 62U) >> 8) & 255U),
        255U ^ (((0U - (x ^ 62U)) >> 8) & 255U),
        255U ^ (((0U - (x ^ 63U)) >> 8) & 255U)
    };
    unsigned int values[5] = {
        x + 'A', x + ('a' - 26), x + ('0' - 52), '-', '_'
    };
    unsigned int result = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i) {
        result |= masks[i] & values[i];
    }
    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
