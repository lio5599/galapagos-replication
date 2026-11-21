#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Process red, green, and blue in a loop and accumulate their scaled averages.
    // Each branch extracts exactly the channel used by the reference.
    // Red uses signed division unchanged; masked channels include the full 0 through 31 range.
    // Accumulation follows the reference order wherever its arithmetic is defined.
    int result = 0;
    int channel;
    for (channel = 2; channel >= 0; --channel) {
        int a;
        int b;
        int scale;
        if (channel == 2) {
            a = c0 >> 10;
            b = c1 >> 10;
            scale = 1024;
        } else if (channel == 1) {
            a = (c0 & 0x03E0) >> 5;
            b = (c1 & 0x03E0) >> 5;
            scale = 32;
        } else {
            a = c0 & 0x001F;
            b = c1 & 0x001F;
            scale = 1;
        }
        result += ((2 * a + b) / 3) * scale;
    }
    return result;
}


int main(){
    mix(0,0);
}
