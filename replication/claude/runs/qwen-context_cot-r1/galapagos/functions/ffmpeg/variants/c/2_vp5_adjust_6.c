#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Alternative bitwise: handle negative v separately.
    // If v < 0, return t. Otherwise, clamp v to [0, t].
    int is_neg = v >> 31;
    int abs_v = (v ^ is_neg) - is_neg;
    // Clamp to t: if abs_v >= t, result is t, else abs_v.
    int is_over = (abs_v >= t) ? -1 : 0;
    int clamped = (abs_v ^ is_over) - is_over; // if is_over, this gives t? No.
    // Let me use: clamped = abs_v < t ? abs_v : t;
    int result = (abs_v < t) ? abs_v : t;
    // For negative v, we want t. For positive, we want clamped.
    // When v < 0, abs_v = -v, and we still compute result. But we want t for v < 0.
    // The reference returns t for v < 0. So:
    return (v < 0) ? t : ((abs_v < t) ? abs_v : t);
}


int main(){
    vp5_adjust(0,0);
}
