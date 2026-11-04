; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_8.c"
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
  %red_q = alloca i32, align 4
  %green_q = alloca i32, align 4
  %blue_q = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %shl = shl i32 %0, 1
  %and = and i32 %shl, 62
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %and, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %shl2 = shl i32 %2, 1
  %and3 = and i32 %shl2, 1984
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add i32 %and3, %and4
  %shr = ashr i32 %add5, 5
  store i32 %shr, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr6 = ashr i32 %4, 10
  %mul = mul nsw i32 2, %shr6
  %5 = load i32, ptr %c1.addr, align 4
  %shr7 = ashr i32 %5, 10
  %add8 = add nsw i32 %mul, %shr7
  store i32 %add8, ptr %red, align 4
  %6 = load i32, ptr %red, align 4
  %7 = load i32, ptr %red, align 4
  %rem = srem i32 %7, 3
  %sub = sub nsw i32 %6, %rem
  %div = sdiv i32 %sub, 3
  store i32 %div, ptr %red_q, align 4
  %8 = load i32, ptr %green, align 4
  %9 = load i32, ptr %green, align 4
  %rem9 = srem i32 %9, 3
  %sub10 = sub nsw i32 %8, %rem9
  %div11 = sdiv i32 %sub10, 3
  store i32 %div11, ptr %green_q, align 4
  %10 = load i32, ptr %blue, align 4
  %11 = load i32, ptr %blue, align 4
  %rem12 = srem i32 %11, 3
  %sub13 = sub nsw i32 %10, %rem12
  %div14 = sdiv i32 %sub13, 3
  store i32 %div14, ptr %blue_q, align 4
  %12 = load i32, ptr %red_q, align 4
  %mul15 = mul nsw i32 %12, 1024
  %13 = load i32, ptr %green_q, align 4
  %mul16 = mul nsw i32 %13, 32
  %add17 = add nsw i32 %mul15, %mul16
  %14 = load i32, ptr %blue_q, align 4
  %add18 = add nsw i32 %add17, %14
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
