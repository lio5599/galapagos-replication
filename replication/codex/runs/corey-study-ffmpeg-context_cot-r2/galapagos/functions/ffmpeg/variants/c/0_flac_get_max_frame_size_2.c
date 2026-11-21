#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Reverses the branch condition and exchanges its two bodies.
    // Each input still executes exactly the same arithmetic in the same order.
    // No assumptions about positive channel counts or bit depths are introduced.
    int count = 16;

    count += ch * ((7 + bps + 7) / 8);
    if (ch != 2) {
        count += (ch * bps * blocksize + 7) / 8;
    } else {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    }
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
