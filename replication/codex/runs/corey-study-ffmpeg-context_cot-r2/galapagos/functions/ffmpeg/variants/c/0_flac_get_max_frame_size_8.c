#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Expands the expressions into individual signed integer operations.
    // Their original grouping is retained rather than algebraically reassociated.
    // Negative values retain C division semantics and no new overflow is introduced.
    int count = 16;
    int overhead = 7 + bps;
    int payload;

    overhead = overhead + 7;
    overhead = overhead / 8;
    overhead = ch * overhead;
    count = count + overhead;

    if (ch == 2) {
        payload = 2 * bps;
        payload = payload + 1;
    } else {
        payload = ch * bps;
    }
    payload = payload * blocksize;
    payload = payload + 7;
    payload = payload / 8;
    count = count + payload;
    count = count + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
