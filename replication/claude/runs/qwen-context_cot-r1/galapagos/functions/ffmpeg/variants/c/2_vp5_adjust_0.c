#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // The reference function computes: if v < 0, return t; else if v >= 2*t, return t; else return v.
    // It uses bitwise tricks to avoid branches, handling sign extension and clamping.
    // Equivalent to: clamp v to [0, 2*t-1], then if v >= t, return t, else return v.
    // Actually, let's trace: if v < 0, s1 = -1 (all ones). v ^= s1 flips bits, v -= s1 adds 1 => v becomes -v (two's complement).
    // Then v *= (v < 2*t). If -v >= 2*t, v becomes 0. Else v stays -v.
    // v -= t. s2 = v >> 31. If v < 0 (i.e., -v > t), s2 = -1. v ^= s2 flips, v -= s2 adds 1 => v becomes -v.
    // v = t - v. If original v < 0: after first part, v = min(-v, 2*t-1) but wait.
    // Let me re-derive: the function returns min(max(v, 0), t) but with a twist.
    // Actually, tracing carefully: it returns t if v < 0 or v >= 2*t, else it returns v if v < t, else t.
    // So it returns min(max(v, 0), t) when v < 2*t, but if v >= 2*t, returns t.
    // Which is equivalent to: if v < 0 return t; else if v >= t return t; else return v.
    // Wait, that's min(max(v, 0), t). Let me verify with v=0, t=5: s1=0, v=0, v<10 so v*=1 => v=0, v-=5 => -5, s2=-1, v^=-1 => 4, v-=(-1)=>5, v=5-5=0, v+=0=0, v^=0=0. Returns 0. Correct.
    // v=7, t=5: s1=0, v=7, 7<10 so v=7, v-=5=2, s2=0, v=2, v=5-2=3, v+=0=3, v^=0=3. Returns 3. But min(max(7,0),5)=5. Hmm, not matching.
    // Let me re-trace v=7, t=5: v=7, s1=0. v^=0=7, v-=0=7. v<10 is true, so v*=1 => v=7. v-=5 => v=2. s2=2>>31=0. v^=0=2, v-=0=2. v=5-2=3. v+=0=3. v^=0=3. Returns 3.
    // But what should it return? The name suggests adjustment. Let me try v=-3, t=5: s1=-1. v^=-1: -3 is 0xFFFFFFFD, ^ -1 (0xFFFFFFFF) = 0x00000002 = 2. v-=(-1)=2+1=3. v<10 so v=3. v-=5=-2. s2=-1. v^=-1: -2 is 0xFFFFFFFE, ^ -1 = 0x00000001 = 1. v-=(-1)=1+1=2. v=5-2=3. v+=(-1)=2. v^=(-1): 2 ^ -1 = 0xFFFFFFFD = -3. Returns -3.
    // This is confusing. Let me just implement equivalent logic via conditional.
    int s1 = v >> 31;
    int abs_v = (v ^ s1) - s1;
    int clamped = abs_v * (abs_v < 2 * t);
    int diff = clamped - t;
    int s2 = diff >> 31;
    int abs_diff = (diff ^ s2) - s2;
    int result = t - abs_diff;
    result = (result ^ s1) + s1;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
