#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes the frame-size bound from overhead, channels, depth, and block size.
    // Names the overhead and payload terms while preserving arithmetic order.
    // Signed division and the stereo special case are unchanged for all defined inputs.
    int count;
    int overhead;
    int payload;

    overhead = ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        payload = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        payload = (ch * bps * blocksize + 7) / 8;
    }

    count = 16;
    count += overhead;
    count += payload;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
