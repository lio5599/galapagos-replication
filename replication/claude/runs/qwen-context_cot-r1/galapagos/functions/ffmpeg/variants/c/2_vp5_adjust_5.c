#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Bitwise approach similar to reference but with clearer variable names.
    // Compute absolute value of v using sign bit.
    int sign = v >> 31;
    int abs_v = (v ^ sign) - sign;
    // Clamp abs_v to [0, 2*t - 1] by multiplying with condition.
    int clamped = abs_v * (abs_v < 2 * t);
    // Compute distance from t, take absolute value.
    int dist = clamped - t;
    int dist_sign = dist >> 31;
    int abs_dist = (dist ^ dist_sign) - dist_sign;
    // Result is t minus absolute distance, adjusted for original sign.
    int res = t - abs_dist;
    return (res ^ sign) + sign;
}


int main(){
    vp5_adjust(0,0);
}
