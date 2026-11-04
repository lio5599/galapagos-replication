; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_1.c"
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
  %r0 = alloca i32, align 4
  %r1 = alloca i32, align 4
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
  %shr = ashr i32 %2, 5
  %and2 = and i32 %shr, 31
  store i32 %and2, ptr %g0, align 4
  %3 = load i32, ptr %c1.addr, align 4
  %shr3 = ashr i32 %3, 5
  %and4 = and i32 %shr3, 31
  store i32 %and4, ptr %g1, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr5 = ashr i32 %4, 10
  store i32 %shr5, ptr %r0, align 4
  %5 = load i32, ptr %c1.addr, align 4
  %shr6 = ashr i32 %5, 10
  store i32 %shr6, ptr %r1, align 4
  %6 = load i32, ptr %b0, align 4
  %mul = mul nsw i32 2, %6
  %7 = load i32, ptr %b1, align 4
  %add = add nsw i32 %mul, %7
  store i32 %add, ptr %blue, align 4
  %8 = load i32, ptr %g0, align 4
  %mul7 = mul nsw i32 2, %8
  %9 = load i32, ptr %g1, align 4
  %add8 = add nsw i32 %mul7, %9
  store i32 %add8, ptr %green, align 4
  %10 = load i32, ptr %r0, align 4
  %mul9 = mul nsw i32 2, %10
  %11 = load i32, ptr %r1, align 4
  %add10 = add nsw i32 %mul9, %11
  store i32 %add10, ptr %red, align 4
  %12 = load i32, ptr %red, align 4
  %div = sdiv i32 %12, 3
  %mul11 = mul nsw i32 %div, 1024
  %13 = load i32, ptr %green, align 4
  %div12 = sdiv i32 %13, 3
  %mul13 = mul nsw i32 %div12, 32
  %add14 = add nsw i32 %mul11, %mul13
  %14 = load i32, ptr %blue, align 4
  %div15 = sdiv i32 %14, 3
  %add16 = add nsw i32 %add14, %div15
  ret i32 %add16
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
