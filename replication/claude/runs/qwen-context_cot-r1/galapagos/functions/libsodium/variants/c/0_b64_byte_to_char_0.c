#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
// Reference computes base64 encoding char for x in 0-63:
// 0-25 -> 'A'+x, 26-51 -> 'a'+(x-26), 52-61 -> '0'+(x-52), 62->'+', 63->'/'
// Uses branchless arithmetic with overflow checks via signed shift.
{
    int result = 0;
    if (x < 26) {
        result = x + 'A';
    } else if (x < 52) {
        result = x - 26 + 'a';
    } else if (x < 62) {
        result = x - 52 + '0';
    } else if (x == 62) {
        result = '+';
    } else if (x == 63) {
        result = '/';
    }
    return result;
}


int main(){
    b64_byte_to_char(0);
}
