; ModuleID = '/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
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
  %segment = alloca i32, align 4
  %nonzero = alloca i32, align 4
  %magnitude = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %conv1 = trunc i32 %xor to i8
  store i8 %conv1, ptr %a_val.addr, align 1
  %1 = load i8, ptr %a_val.addr, align 1
  %conv2 = zext i8 %1 to i32
  %shr = ashr i32 %conv2, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %segment, align 4
  %cmp = icmp ne i32 %2, 0
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, ptr %nonzero, align 4
  %3 = load i8, ptr %a_val.addr, align 1
  %conv4 = zext i8 %3 to i32
  %and5 = and i32 %conv4, 15
  %shl = shl i32 %and5, 4
  %add = add nsw i32 %shl, 8
  %4 = load i32, ptr %nonzero, align 4
  %shl6 = shl i32 %4, 8
  %add7 = add nsw i32 %add, %shl6
  store i32 %add7, ptr %magnitude, align 4
  %5 = load i32, ptr %segment, align 4
  %6 = load i32, ptr %nonzero, align 4
  %sub = sub nsw i32 %5, %6
  %7 = load i32, ptr %magnitude, align 4
  %shl8 = shl i32 %7, %sub
  store i32 %shl8, ptr %magnitude, align 4
  %8 = load i32, ptr %magnitude, align 4
  %9 = load i32, ptr %magnitude, align 4
  %mul = mul nsw i32 2, %9
  %10 = load i8, ptr %a_val.addr, align 1
  %conv9 = zext i8 %10 to i32
  %shr10 = ashr i32 %conv9, 7
  %xor11 = xor i32 %shr10, 1
  %mul12 = mul nsw i32 %mul, %xor11
  %sub13 = sub nsw i32 %8, %mul12
  ret i32 %sub13
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
