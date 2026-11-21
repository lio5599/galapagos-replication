#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Builds the payload numerator in stages matching the original grouping.
    // Division remains signed division by eight, not a shift.
    // This preserves zero and negative cases and introduces no new overflow
    // on inputs for which the reference has defined behavior.
    int count = 16;
    int payload;

    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        payload = 2 * bps;
        payload += 1;
    } else {
        payload = ch * bps;
    }
    payload *= blocksize;
    payload += 7;
    payload /= 8;
    count += payload;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
