; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded-retry/functions/ffmpeg/variants/c/1_mix_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded-retry/functions/ffmpeg/variants/c/1_mix_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %0, 10
  %mul = mul nsw i32 2, %shr
  %1 = load i32, ptr %c1.addr, align 4
  %shr1 = ashr i32 %1, 10
  %add = add nsw i32 %mul, %shr1
  %div = sdiv i32 %add, 3
  store i32 %div, ptr %result, align 4
  %2 = load i32, ptr %result, align 4
  %mul2 = mul nsw i32 %2, 32
  store i32 %mul2, ptr %result, align 4
  %3 = load i32, ptr %c0.addr, align 4
  %and = and i32 %3, 992
  %shr3 = ashr i32 %and, 5
  %mul4 = mul nsw i32 2, %shr3
  %4 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %4, 992
  %shr6 = ashr i32 %and5, 5
  %add7 = add nsw i32 %mul4, %shr6
  %div8 = sdiv i32 %add7, 3
  %5 = load i32, ptr %result, align 4
  %add9 = add nsw i32 %5, %div8
  store i32 %add9, ptr %result, align 4
  %6 = load i32, ptr %result, align 4
  %mul10 = mul nsw i32 %6, 32
  store i32 %mul10, ptr %result, align 4
  %7 = load i32, ptr %c0.addr, align 4
  %and11 = and i32 %7, 31
  %mul12 = mul nsw i32 2, %and11
  %8 = load i32, ptr %c1.addr, align 4
  %and13 = and i32 %8, 31
  %add14 = add nsw i32 %mul12, %and13
  %div15 = sdiv i32 %add14, 3
  %9 = load i32, ptr %result, align 4
  %add16 = add nsw i32 %9, %div15
  store i32 %add16, ptr %result, align 4
  %10 = load i32, ptr %result, align 4
  ret i32 %10
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
