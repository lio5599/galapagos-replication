#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Directly returns the sum of all components in a single expression.
    // 16 for frame header, ch*((bps+14)/8) for subframe headers, residual bytes
    // selected via ternary, and 2 for CRC. Equivalent to reference for all inputs.
    int count;
    count = 16 + ch * ((bps + 14) / 8) + ((ch == 2) ? ((2 * bps + 1) * blocksize + 7) / 8 : (ch * bps * blocksize + 7) / 8) + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
