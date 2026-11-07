; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/1_iec958_parity_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/1_iec958_parity_9.c"
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
  store i32 %data, ptr %data.addr, align 4
  %0 = load i32, ptr %data.addr, align 4
  %shr = lshr i32 %0, 4
  %1 = load i32, ptr %data.addr, align 4
  %shr1 = lshr i32 %1, 5
  %xor = xor i32 %shr, %shr1
  %2 = load i32, ptr %data.addr, align 4
  %shr2 = lshr i32 %2, 6
  %xor3 = xor i32 %xor, %shr2
  %3 = load i32, ptr %data.addr, align 4
  %shr4 = lshr i32 %3, 7
  %xor5 = xor i32 %xor3, %shr4
  %4 = load i32, ptr %data.addr, align 4
  %shr6 = lshr i32 %4, 8
  %xor7 = xor i32 %xor5, %shr6
  %5 = load i32, ptr %data.addr, align 4
  %shr8 = lshr i32 %5, 9
  %xor9 = xor i32 %xor7, %shr8
  %6 = load i32, ptr %data.addr, align 4
  %shr10 = lshr i32 %6, 10
  %xor11 = xor i32 %xor9, %shr10
  %7 = load i32, ptr %data.addr, align 4
  %shr12 = lshr i32 %7, 11
  %xor13 = xor i32 %xor11, %shr12
  %8 = load i32, ptr %data.addr, align 4
  %shr14 = lshr i32 %8, 12
  %xor15 = xor i32 %xor13, %shr14
  %9 = load i32, ptr %data.addr, align 4
  %shr16 = lshr i32 %9, 13
  %xor17 = xor i32 %xor15, %shr16
  %10 = load i32, ptr %data.addr, align 4
  %shr18 = lshr i32 %10, 14
  %xor19 = xor i32 %xor17, %shr18
  %11 = load i32, ptr %data.addr, align 4
  %shr20 = lshr i32 %11, 15
  %xor21 = xor i32 %xor19, %shr20
  %12 = load i32, ptr %data.addr, align 4
  %shr22 = lshr i32 %12, 16
  %xor23 = xor i32 %xor21, %shr22
  %13 = load i32, ptr %data.addr, align 4
  %shr24 = lshr i32 %13, 17
  %xor25 = xor i32 %xor23, %shr24
  %14 = load i32, ptr %data.addr, align 4
  %shr26 = lshr i32 %14, 18
  %xor27 = xor i32 %xor25, %shr26
  %15 = load i32, ptr %data.addr, align 4
  %shr28 = lshr i32 %15, 19
  %xor29 = xor i32 %xor27, %shr28
  %16 = load i32, ptr %data.addr, align 4
  %shr30 = lshr i32 %16, 20
  %xor31 = xor i32 %xor29, %shr30
  %17 = load i32, ptr %data.addr, align 4
  %shr32 = lshr i32 %17, 21
  %xor33 = xor i32 %xor31, %shr32
  %18 = load i32, ptr %data.addr, align 4
  %shr34 = lshr i32 %18, 22
  %xor35 = xor i32 %xor33, %shr34
  %19 = load i32, ptr %data.addr, align 4
  %shr36 = lshr i32 %19, 23
  %xor37 = xor i32 %xor35, %shr36
  %20 = load i32, ptr %data.addr, align 4
  %shr38 = lshr i32 %20, 24
  %xor39 = xor i32 %xor37, %shr38
  %21 = load i32, ptr %data.addr, align 4
  %shr40 = lshr i32 %21, 25
  %xor41 = xor i32 %xor39, %shr40
  %22 = load i32, ptr %data.addr, align 4
  %shr42 = lshr i32 %22, 26
  %xor43 = xor i32 %xor41, %shr42
  %23 = load i32, ptr %data.addr, align 4
  %shr44 = lshr i32 %23, 27
  %xor45 = xor i32 %xor43, %shr44
  %24 = load i32, ptr %data.addr, align 4
  %shr46 = lshr i32 %24, 28
  %xor47 = xor i32 %xor45, %shr46
  %25 = load i32, ptr %data.addr, align 4
  %shr48 = lshr i32 %25, 29
  %xor49 = xor i32 %xor47, %shr48
  %26 = load i32, ptr %data.addr, align 4
  %shr50 = lshr i32 %26, 30
  %xor51 = xor i32 %xor49, %shr50
  %and = and i32 %xor51, 1
  ret i32 %and
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
