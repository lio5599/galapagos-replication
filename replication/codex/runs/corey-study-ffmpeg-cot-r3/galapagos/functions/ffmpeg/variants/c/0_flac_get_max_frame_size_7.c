#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Selects the payload multiplier, then shares the remaining operations.
    // The general multiplier is evaluated as ch times bps, as in the reference.
    // Signed division and addition order are retained for all defined inputs,
    // including zero and negative values.
    int count = 16;
    int multiplier;

    count += ch * ((7 + bps + 7) / 8);
    multiplier = (ch == 2) ? (2 * bps + 1) : (ch * bps);
    count += (multiplier * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
