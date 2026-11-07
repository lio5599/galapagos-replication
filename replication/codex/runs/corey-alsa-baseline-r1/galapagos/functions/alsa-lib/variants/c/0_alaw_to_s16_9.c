#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int code, segment, magnitude;

    code = (a_val ^ 0x55) & 127;
    segment = code / 16;
    magnitude = (code % 16) * 16 + 8;

    if (segment != 0) {
        magnitude += 256;
        switch (segment) {
        case 7: magnitude *= 2; /* fall through */
        case 6: magnitude *= 2; /* fall through */
        case 5: magnitude *= 2; /* fall through */
        case 4: magnitude *= 2; /* fall through */
        case 3: magnitude *= 2; /* fall through */
        case 2: magnitude *= 2; /* fall through */
        default: break;
        }
    }

    return (a_val & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
