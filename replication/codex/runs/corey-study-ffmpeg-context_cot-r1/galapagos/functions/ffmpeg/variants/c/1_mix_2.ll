; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r1/functions/ffmpeg/variants/c/1_mix_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r1/functions/ffmpeg/variants/c/1_mix_2.c"
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
  %b0 = alloca i32, align 4
  %g0 = alloca i32, align 4
  %r0 = alloca i32, align 4
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %b0, align 4
  %1 = load i32, ptr %c0.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  store i32 %shr, ptr %g0, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %shr2 = ashr i32 %2, 10
  store i32 %shr2, ptr %r0, align 4
  %3 = load i32, ptr %b0, align 4
  %mul = mul nsw i32 3, %3
  %4 = load i32, ptr %c1.addr, align 4
  %and3 = and i32 %4, 31
  %5 = load i32, ptr %b0, align 4
  %sub = sub nsw i32 %and3, %5
  %add = add nsw i32 %mul, %sub
  store i32 %add, ptr %blue, align 4
  %6 = load i32, ptr %g0, align 4
  %mul4 = mul nsw i32 3, %6
  %7 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %7, 992
  %shr6 = ashr i32 %and5, 5
  %8 = load i32, ptr %g0, align 4
  %sub7 = sub nsw i32 %shr6, %8
  %add8 = add nsw i32 %mul4, %sub7
  store i32 %add8, ptr %green, align 4
  %9 = load i32, ptr %r0, align 4
  %mul9 = mul nsw i32 3, %9
  %10 = load i32, ptr %c1.addr, align 4
  %shr10 = ashr i32 %10, 10
  %11 = load i32, ptr %r0, align 4
  %sub11 = sub nsw i32 %shr10, %11
  %add12 = add nsw i32 %mul9, %sub11
  store i32 %add12, ptr %red, align 4
  %12 = load i32, ptr %red, align 4
  %div = sdiv i32 %12, 3
  %mul13 = mul nsw i32 %div, 1024
  %13 = load i32, ptr %green, align 4
  %div14 = sdiv i32 %13, 3
  %mul15 = mul nsw i32 %div14, 32
  %add16 = add nsw i32 %mul13, %mul15
  %14 = load i32, ptr %blue, align 4
  %div17 = sdiv i32 %14, 3
  %add18 = add nsw i32 %add16, %div17
  ret i32 %add18
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
