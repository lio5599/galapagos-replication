#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Returns early for stereo after performing the original final addition.
    // Other channel counts take the general path with the same arithmetic.
    // Addition grouping and signed division are preserved even at edge values.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
        count += 2;
        return count;
    }
    count += (ch * bps * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
