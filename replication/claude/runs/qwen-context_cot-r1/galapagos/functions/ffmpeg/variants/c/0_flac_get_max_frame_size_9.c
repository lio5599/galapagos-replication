#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a switch-like pattern with if-else for stereo detection.
    // Computes all three variable components: subframe header, residual, and combines with constants.
    // Ensures equivalence by preserving the exact arithmetic operations.
    int count;
    int subframe_hdr = ch * ((7 + bps + 7) / 8);
    int residual;
    if (ch == 2) {
        residual = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        residual = (ch * bps * blocksize + 7) / 8;
    }
    count = 16 + subframe_hdr + residual + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
