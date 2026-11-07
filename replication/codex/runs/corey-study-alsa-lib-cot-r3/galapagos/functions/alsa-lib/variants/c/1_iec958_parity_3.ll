; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/1_iec958_parity_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/1_iec958_parity_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @iec958_parity(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @iec958_parity(i32 noundef %data) #0 {
entry:
  %data.addr = alloca i32, align 4
  %x = alloca i64, align 8
  store i32 %data, ptr %data.addr, align 4
  %0 = load i32, ptr %data.addr, align 4
  %conv = zext i32 %0 to i64
  %and = and i64 %conv, 2147483632
  store i64 %and, ptr %x, align 8
  %1 = load i64, ptr %x, align 8
  %shr = lshr i64 %1, 16
  %2 = load i64, ptr %x, align 8
  %xor = xor i64 %2, %shr
  store i64 %xor, ptr %x, align 8
  %3 = load i64, ptr %x, align 8
  %shr1 = lshr i64 %3, 8
  %4 = load i64, ptr %x, align 8
  %xor2 = xor i64 %4, %shr1
  store i64 %xor2, ptr %x, align 8
  %5 = load i64, ptr %x, align 8
  %shr3 = lshr i64 %5, 4
  %6 = load i64, ptr %x, align 8
  %xor4 = xor i64 %6, %shr3
  store i64 %xor4, ptr %x, align 8
  %7 = load i64, ptr %x, align 8
  %shr5 = lshr i64 %7, 2
  %8 = load i64, ptr %x, align 8
  %xor6 = xor i64 %8, %shr5
  store i64 %xor6, ptr %x, align 8
  %9 = load i64, ptr %x, align 8
  %shr7 = lshr i64 %9, 1
  %10 = load i64, ptr %x, align 8
  %xor8 = xor i64 %10, %shr7
  store i64 %xor8, ptr %x, align 8
  %11 = load i64, ptr %x, align 8
  %and9 = and i64 %11, 1
  %conv10 = trunc i64 %and9 to i32
  ret i32 %conv10
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
