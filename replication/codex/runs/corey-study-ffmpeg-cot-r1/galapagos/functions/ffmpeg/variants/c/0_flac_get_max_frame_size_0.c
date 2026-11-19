#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes a maximum FLAC frame size from overhead and rounded payload bytes.
    // A conditional expression selects the original stereo or general formula.
    // Integer division and operation grouping are unchanged, including for zero
    // and negative inputs wherever the reference has defined arithmetic.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    count += (ch == 2)
        ? ((2 * bps + 1) * blocksize + 7) / 8
        : (ch * bps * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
