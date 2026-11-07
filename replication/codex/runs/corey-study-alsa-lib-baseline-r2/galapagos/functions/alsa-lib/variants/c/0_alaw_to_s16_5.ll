; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %value = alloca i32, align 4
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %shift = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %value, align 4
  %1 = load i32, ptr %value, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %segment, align 4
  %3 = load i32, ptr %segment, align 4
  %cmp = icmp ne i32 %3, 0
  %conv1 = zext i1 %cmp to i32
  %sub = sub nsw i32 %2, %conv1
  store i32 %sub, ptr %shift, align 4
  %4 = load i32, ptr %value, align 4
  %and2 = and i32 %4, 15
  %mul = mul nsw i32 %and2, 16
  %add = add nsw i32 %mul, 8
  %5 = load i32, ptr %segment, align 4
  %cmp3 = icmp ne i32 %5, 0
  %conv4 = zext i1 %cmp3 to i32
  %mul5 = mul nsw i32 256, %conv4
  %add6 = add nsw i32 %add, %mul5
  %6 = load i32, ptr %shift, align 4
  %shl = shl i32 %add6, %6
  store i32 %shl, ptr %magnitude, align 4
  %7 = load i32, ptr %magnitude, align 4
  %8 = load i32, ptr %value, align 4
  %shr7 = ashr i32 %8, 7
  %and8 = and i32 %shr7, 1
  %mul9 = mul nsw i32 2, %and8
  %sub10 = sub nsw i32 %mul9, 1
  %mul11 = mul nsw i32 %7, %sub10
  ret i32 %mul11
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
