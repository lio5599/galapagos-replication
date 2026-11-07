; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/1_iec958_parity_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/1_iec958_parity_5.c"
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
  %shr = lshr i32 %0, 4
  %conv = zext i32 %shr to i64
  %and = and i64 %conv, 134217727
  store i64 %and, ptr %x, align 8
  %1 = load i64, ptr %x, align 8
  %2 = load i64, ptr %x, align 8
  %shr1 = lshr i64 %2, 1
  %and2 = and i64 %shr1, 1431655765
  %sub = sub i64 %1, %and2
  store i64 %sub, ptr %x, align 8
  %3 = load i64, ptr %x, align 8
  %and3 = and i64 %3, 858993459
  %4 = load i64, ptr %x, align 8
  %shr4 = lshr i64 %4, 2
  %and5 = and i64 %shr4, 858993459
  %add = add i64 %and3, %and5
  store i64 %add, ptr %x, align 8
  %5 = load i64, ptr %x, align 8
  %6 = load i64, ptr %x, align 8
  %shr6 = lshr i64 %6, 4
  %add7 = add i64 %5, %shr6
  %and8 = and i64 %add7, 252645135
  store i64 %and8, ptr %x, align 8
  %7 = load i64, ptr %x, align 8
  %shr9 = lshr i64 %7, 8
  %8 = load i64, ptr %x, align 8
  %add10 = add i64 %8, %shr9
  store i64 %add10, ptr %x, align 8
  %9 = load i64, ptr %x, align 8
  %shr11 = lshr i64 %9, 16
  %10 = load i64, ptr %x, align 8
  %add12 = add i64 %10, %shr11
  store i64 %add12, ptr %x, align 8
  %11 = load i64, ptr %x, align 8
  %and13 = and i64 %11, 1
  %conv14 = trunc i64 %and13 to i32
  ret i32 %conv14
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
