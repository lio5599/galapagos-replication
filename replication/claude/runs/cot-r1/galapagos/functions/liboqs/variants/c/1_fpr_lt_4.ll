; ModuleID = '/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %d1 = alloca i64, align 8
  %d2 = alloca i64, align 8
  %lt = alloca i64, align 8
  %gt = alloca i64, align 8
  %neg = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %y.addr, align 8
  %sub = sub i64 %0, %1
  store i64 %sub, ptr %d1, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %x.addr, align 8
  %sub1 = sub i64 %2, %3
  store i64 %sub1, ptr %d2, align 8
  %4 = load i64, ptr %x.addr, align 8
  %not = xor i64 %4, -1
  %5 = load i64, ptr %y.addr, align 8
  %and = and i64 %not, %5
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %6, %7
  %not2 = xor i64 %xor, -1
  %8 = load i64, ptr %d1, align 8
  %and3 = and i64 %not2, %8
  %or = or i64 %and, %and3
  %shr = lshr i64 %or, 63
  store i64 %shr, ptr %lt, align 8
  %9 = load i64, ptr %y.addr, align 8
  %not4 = xor i64 %9, -1
  %10 = load i64, ptr %x.addr, align 8
  %and5 = and i64 %not4, %10
  %11 = load i64, ptr %x.addr, align 8
  %12 = load i64, ptr %y.addr, align 8
  %xor6 = xor i64 %11, %12
  %not7 = xor i64 %xor6, -1
  %13 = load i64, ptr %d2, align 8
  %and8 = and i64 %not7, %13
  %or9 = or i64 %and5, %and8
  %shr10 = lshr i64 %or9, 63
  store i64 %shr10, ptr %gt, align 8
  %14 = load i64, ptr %x.addr, align 8
  %15 = load i64, ptr %y.addr, align 8
  %or11 = or i64 %14, %15
  %shr12 = lshr i64 %or11, 63
  %sub13 = sub i64 0, %shr12
  store i64 %sub13, ptr %neg, align 8
  %16 = load i64, ptr %lt, align 8
  %17 = load i64, ptr %neg, align 8
  %not14 = xor i64 %17, -1
  %and15 = and i64 %16, %not14
  %18 = load i64, ptr %gt, align 8
  %19 = load i64, ptr %neg, align 8
  %and16 = and i64 %18, %19
  %or17 = or i64 %and15, %and16
  %conv = trunc i64 %or17 to i32
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
