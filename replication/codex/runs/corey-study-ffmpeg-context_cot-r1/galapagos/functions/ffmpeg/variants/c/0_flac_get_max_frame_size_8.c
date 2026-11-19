#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses successive local values instead of mutating a single accumulator.
    // Each value corresponds to one original accumulation step.
    // Exact grouping and signed division preserve all reference-defined edge cases.
    int base = 16;
    int with_overhead = base + ch * ((7 + bps + 7) / 8);
    int with_payload;

    if (ch == 2) {
        with_payload = with_overhead + ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        with_payload = with_overhead + (ch * bps * blocksize + 7) / 8;
    }
    return with_payload + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
