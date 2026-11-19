; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_2.c"
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
  %b1 = alloca i32, align 4
  %g0 = alloca i32, align 4
  %g1 = alloca i32, align 4
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %b0, align 4
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  store i32 %and1, ptr %b1, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %shr = ashr i32 %and2, 5
  store i32 %shr, ptr %g0, align 4
  %3 = load i32, ptr %c1.addr, align 4
  %and3 = and i32 %3, 992
  %shr4 = ashr i32 %and3, 5
  store i32 %shr4, ptr %g1, align 4
  %4 = load i32, ptr %b0, align 4
  %div = sdiv i32 %4, 3
  %mul = mul nsw i32 2, %div
  %5 = load i32, ptr %b1, align 4
  %div5 = sdiv i32 %5, 3
  %add = add nsw i32 %mul, %div5
  %6 = load i32, ptr %b0, align 4
  %rem = srem i32 %6, 3
  %mul6 = mul nsw i32 2, %rem
  %7 = load i32, ptr %b1, align 4
  %rem7 = srem i32 %7, 3
  %add8 = add nsw i32 %mul6, %rem7
  %div9 = sdiv i32 %add8, 3
  %add10 = add nsw i32 %add, %div9
  store i32 %add10, ptr %blue, align 4
  %8 = load i32, ptr %g0, align 4
  %div11 = sdiv i32 %8, 3
  %mul12 = mul nsw i32 2, %div11
  %9 = load i32, ptr %g1, align 4
  %div13 = sdiv i32 %9, 3
  %add14 = add nsw i32 %mul12, %div13
  %10 = load i32, ptr %g0, align 4
  %rem15 = srem i32 %10, 3
  %mul16 = mul nsw i32 2, %rem15
  %11 = load i32, ptr %g1, align 4
  %rem17 = srem i32 %11, 3
  %add18 = add nsw i32 %mul16, %rem17
  %div19 = sdiv i32 %add18, 3
  %add20 = add nsw i32 %add14, %div19
  store i32 %add20, ptr %green, align 4
  %12 = load i32, ptr %c0.addr, align 4
  %shr21 = ashr i32 %12, 10
  %mul22 = mul nsw i32 2, %shr21
  %13 = load i32, ptr %c1.addr, align 4
  %shr23 = ashr i32 %13, 10
  %add24 = add nsw i32 %mul22, %shr23
  %div25 = sdiv i32 %add24, 3
  store i32 %div25, ptr %red, align 4
  %14 = load i32, ptr %red, align 4
  %mul26 = mul nsw i32 %14, 1024
  %15 = load i32, ptr %green, align 4
  %mul27 = mul nsw i32 %15, 32
  %add28 = add nsw i32 %mul26, %mul27
  %16 = load i32, ptr %blue, align 4
  %add29 = add nsw i32 %add28, %16
  ret i32 %add29
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
