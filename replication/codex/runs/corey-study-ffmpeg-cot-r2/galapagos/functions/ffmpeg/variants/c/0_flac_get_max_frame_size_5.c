#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a conditional factor followed by a common payload calculation.
    // Only the selected factor is evaluated, as in the reference branches.
    // Original signed arithmetic grouping is retained for all defined inputs.
    int count = 16;
    int factor;
    count += ch * ((7 + bps + 7) / 8);
    factor = ch == 2 ? 2 * bps + 1 : ch * bps;
    count += (factor * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
