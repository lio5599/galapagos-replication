#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Tracks successive totals in separate variables rather than one counter.
    // The totals preserve the original header, payload, then trailer order.
    // Original expressions retain signed truncation and match all edge cases
    // for which the reference arithmetic has defined behavior.
    int initial = 16;
    int with_header = initial + ch * ((7 + bps + 7) / 8);
    int with_payload;
    int complete;

    if (ch == 2)
        with_payload = with_header
            + ((2 * bps + 1) * blocksize + 7) / 8;
    else
        with_payload = with_header
            + (ch * bps * blocksize + 7) / 8;

    complete = with_payload + 2;
    return complete;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
