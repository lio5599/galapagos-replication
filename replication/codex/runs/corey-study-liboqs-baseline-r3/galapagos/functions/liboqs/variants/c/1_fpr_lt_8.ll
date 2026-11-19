; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/1_fpr_lt_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/1_fpr_lt_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %different = alloca i32, align 4
  %forward = alloca i32, align 4
  %reverse = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %1 = load i64, ptr %x.addr, align 8
  %2 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %1, %2
  %shr1 = lshr i64 %xor, 63
  %conv2 = trunc i64 %shr1 to i32
  store i32 %conv2, ptr %different, align 4
  %3 = load i64, ptr %x.addr, align 8
  %4 = load i64, ptr %y.addr, align 8
  %sub = sub i64 %3, %4
  %shr3 = lshr i64 %sub, 63
  %conv4 = trunc i64 %shr3 to i32
  store i32 %conv4, ptr %forward, align 4
  %5 = load i64, ptr %y.addr, align 8
  %6 = load i64, ptr %x.addr, align 8
  %sub5 = sub i64 %5, %6
  %shr6 = lshr i64 %sub5, 63
  %conv7 = trunc i64 %shr6 to i32
  store i32 %conv7, ptr %reverse, align 4
  %7 = load i32, ptr %different, align 4
  %8 = load i32, ptr %sx, align 4
  %and = and i32 %7, %8
  %9 = load i32, ptr %different, align 4
  %xor8 = xor i32 %9, 1
  %10 = load i32, ptr %forward, align 4
  %11 = load i32, ptr %sx, align 4
  %xor9 = xor i32 %11, 1
  %and10 = and i32 %10, %xor9
  %12 = load i32, ptr %reverse, align 4
  %13 = load i32, ptr %sx, align 4
  %and11 = and i32 %12, %13
  %or = or i32 %and10, %and11
  %and12 = and i32 %xor8, %or
  %or13 = or i32 %and, %and12
  ret i32 %or13
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
