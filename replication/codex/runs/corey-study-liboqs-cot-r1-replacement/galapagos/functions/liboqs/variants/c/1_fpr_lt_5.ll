; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_5.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %mask = alloca i64, align 8
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  %sx = alloca i64, align 8
  %different = alloca i64, align 8
  %forward = alloca i64, align 8
  %reverse = alloca i64, align 8
  %same = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 9223372036854775807, ptr %mask, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %mask, align 8
  %and = and i64 %0, %1
  store i64 %and, ptr %a, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %mask, align 8
  %and1 = and i64 %2, %3
  store i64 %and1, ptr %b, align 8
  %4 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %4, 63
  store i64 %shr, ptr %sx, align 8
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %5, %6
  %shr2 = lshr i64 %xor, 63
  store i64 %shr2, ptr %different, align 8
  %7 = load i64, ptr %a, align 8
  %8 = load i64, ptr %b, align 8
  %sub = sub i64 %7, %8
  %shr3 = lshr i64 %sub, 63
  store i64 %shr3, ptr %forward, align 8
  %9 = load i64, ptr %b, align 8
  %10 = load i64, ptr %a, align 8
  %sub4 = sub i64 %9, %10
  %shr5 = lshr i64 %sub4, 63
  store i64 %shr5, ptr %reverse, align 8
  %11 = load i64, ptr %forward, align 8
  %12 = load i64, ptr %forward, align 8
  %13 = load i64, ptr %reverse, align 8
  %xor6 = xor i64 %12, %13
  %14 = load i64, ptr %sx, align 8
  %and7 = and i64 %xor6, %14
  %xor8 = xor i64 %11, %and7
  store i64 %xor8, ptr %same, align 8
  %15 = load i64, ptr %different, align 8
  %16 = load i64, ptr %sx, align 8
  %and9 = and i64 %15, %16
  %17 = load i64, ptr %different, align 8
  %xor10 = xor i64 %17, 1
  %18 = load i64, ptr %same, align 8
  %and11 = and i64 %xor10, %18
  %or = or i64 %and9, %and11
  %conv = trunc i64 %or to i32
  ret i32 %conv
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
