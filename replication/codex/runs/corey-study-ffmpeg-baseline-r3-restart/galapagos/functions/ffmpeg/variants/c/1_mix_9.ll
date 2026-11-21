; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-baseline-r3-restart/functions/ffmpeg/variants/c/1_mix_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-baseline-r3-restart/functions/ffmpeg/variants/c/1_mix_9.c"
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
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c1.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %blue, align 4
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  store i32 %shr, ptr %green, align 4
  %2 = load i32, ptr %c1.addr, align 4
  %shr2 = ashr i32 %2, 10
  store i32 %shr2, ptr %red, align 4
  %3 = load i32, ptr %c0.addr, align 4
  %and3 = and i32 %3, 31
  %mul = mul nsw i32 2, %and3
  %4 = load i32, ptr %blue, align 4
  %add = add nsw i32 %4, %mul
  store i32 %add, ptr %blue, align 4
  %5 = load i32, ptr %c0.addr, align 4
  %and4 = and i32 %5, 992
  %shr5 = ashr i32 %and4, 5
  %mul6 = mul nsw i32 2, %shr5
  %6 = load i32, ptr %green, align 4
  %add7 = add nsw i32 %6, %mul6
  store i32 %add7, ptr %green, align 4
  %7 = load i32, ptr %c0.addr, align 4
  %shr8 = ashr i32 %7, 10
  %mul9 = mul nsw i32 2, %shr8
  %8 = load i32, ptr %red, align 4
  %add10 = add nsw i32 %8, %mul9
  store i32 %add10, ptr %red, align 4
  %9 = load i32, ptr %red, align 4
  %div = sdiv i32 %9, 3
  %mul11 = mul nsw i32 %div, 1024
  store i32 %mul11, ptr %result, align 4
  %10 = load i32, ptr %green, align 4
  %div12 = sdiv i32 %10, 3
  %mul13 = mul nsw i32 %div12, 32
  %11 = load i32, ptr %result, align 4
  %add14 = add nsw i32 %11, %mul13
  store i32 %add14, ptr %result, align 4
  %12 = load i32, ptr %blue, align 4
  %div15 = sdiv i32 %12, 3
  %13 = load i32, ptr %result, align 4
  %add16 = add nsw i32 %13, %div15
  store i32 %add16, ptr %result, align 4
  %14 = load i32, ptr %result, align 4
  ret i32 %14
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
