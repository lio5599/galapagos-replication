; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_5.c"
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
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %shr = ashr i32 %and2, 5
  %mul3 = mul nsw i32 2, %shr
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %shr5 = ashr i32 %and4, 5
  %add6 = add nsw i32 %mul3, %shr5
  store i32 %add6, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul8 = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr9 = ashr i32 %5, 10
  %add10 = add nsw i32 %mul8, %shr9
  store i32 %add10, ptr %red, align 4
  %6 = load i32, ptr %blue, align 4
  %7 = load i32, ptr %blue, align 4
  %rem = srem i32 %7, 3
  %sub = sub nsw i32 %6, %rem
  %div = sdiv i32 %sub, 3
  store i32 %div, ptr %blue, align 4
  %8 = load i32, ptr %green, align 4
  %9 = load i32, ptr %green, align 4
  %rem11 = srem i32 %9, 3
  %sub12 = sub nsw i32 %8, %rem11
  %div13 = sdiv i32 %sub12, 3
  store i32 %div13, ptr %green, align 4
  %10 = load i32, ptr %red, align 4
  %11 = load i32, ptr %red, align 4
  %rem14 = srem i32 %11, 3
  %sub15 = sub nsw i32 %10, %rem14
  %div16 = sdiv i32 %sub15, 3
  store i32 %div16, ptr %red, align 4
  %12 = load i32, ptr %red, align 4
  %mul17 = mul nsw i32 %12, 1024
  %13 = load i32, ptr %green, align 4
  %mul18 = mul nsw i32 %13, 32
  %add19 = add nsw i32 %mul17, %mul18
  %14 = load i32, ptr %blue, align 4
  %add20 = add nsw i32 %add19, %14
  ret i32 %add20
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
