; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %mask = alloca i64, align 8
  %ax = alloca i64, align 8
  %ay = alloca i64, align 8
  %sx = alloca i32, align 4
  %sy = alloca i32, align 4
  %less = alloca i32, align 4
  %greater = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 9223372036854775807, ptr %mask, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %mask, align 8
  %and = and i64 %0, %1
  store i64 %and, ptr %ax, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %mask, align 8
  %and1 = and i64 %2, %3
  store i64 %and1, ptr %ay, align 8
  %4 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %4, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %5 = load i64, ptr %y.addr, align 8
  %shr2 = lshr i64 %5, 63
  %conv3 = trunc i64 %shr2 to i32
  store i32 %conv3, ptr %sy, align 4
  %6 = load i64, ptr %ax, align 8
  %7 = load i64, ptr %ay, align 8
  %sub = sub i64 %6, %7
  %shr4 = lshr i64 %sub, 63
  %conv5 = trunc i64 %shr4 to i32
  store i32 %conv5, ptr %less, align 4
  %8 = load i64, ptr %ay, align 8
  %9 = load i64, ptr %ax, align 8
  %sub6 = sub i64 %8, %9
  %shr7 = lshr i64 %sub6, 63
  %conv8 = trunc i64 %shr7 to i32
  store i32 %conv8, ptr %greater, align 4
  %10 = load i32, ptr %sx, align 4
  %11 = load i32, ptr %sy, align 4
  %xor = xor i32 %10, %11
  %12 = load i32, ptr %sx, align 4
  %and9 = and i32 %xor, %12
  %13 = load i32, ptr %sx, align 4
  %xor10 = xor i32 1, %13
  %14 = load i32, ptr %sy, align 4
  %xor11 = xor i32 %xor10, %14
  %15 = load i32, ptr %less, align 4
  %16 = load i32, ptr %sx, align 4
  %xor12 = xor i32 %16, 1
  %and13 = and i32 %15, %xor12
  %17 = load i32, ptr %greater, align 4
  %18 = load i32, ptr %sx, align 4
  %and14 = and i32 %17, %18
  %or = or i32 %and13, %and14
  %and15 = and i32 %xor11, %or
  %or16 = or i32 %and9, %and15
  ret i32 %or16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @fpr_lt(i64 noundef 0, i64 noundef 0)
  ret i32 0
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
