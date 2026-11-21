#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes the maximum FLAC frame size from block size, channels, and bit depth.
    // A conditional expression selects the same stereo or general payload.
    // Arithmetic order and signed division are unchanged, including for zero
    // and negative inputs wherever the reference has defined behavior.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    count += (ch == 2)
        ? (((2 * bps + 1) * blocksize + 7) / 8)
        : ((ch * bps * blocksize + 7) / 8);
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
