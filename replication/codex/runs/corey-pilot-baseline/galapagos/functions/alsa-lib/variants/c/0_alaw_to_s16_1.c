#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int magnitude;

    a_val ^= 0x55;
    magnitude = (a_val & 15) * 16;

    switch ((a_val >> 4) & 7) {
    case 0: magnitude += 8; break;
    case 1: magnitude += 264; break;
    case 2: magnitude = (magnitude + 264) * 2; break;
    case 3: magnitude = (magnitude + 264) * 4; break;
    case 4: magnitude = (magnitude + 264) * 8; break;
    case 5: magnitude = (magnitude + 264) * 16; break;
    case 6: magnitude = (magnitude + 264) * 32; break;
    default: magnitude = (magnitude + 264) * 64; break;
    }

    return (a_val & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
