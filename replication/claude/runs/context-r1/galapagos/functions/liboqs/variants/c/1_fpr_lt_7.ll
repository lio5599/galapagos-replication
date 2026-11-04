; ModuleID = '/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %m = alloca i64, align 8
  %d = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %y.addr, align 8
  %and = and i64 %0, %1
  %shr = lshr i64 %and, 63
  %sub = sub i64 0, %shr
  store i64 %sub, ptr %m, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %x.addr, align 8
  %sub1 = sub i64 %2, %3
  %4 = load i64, ptr %m, align 8
  %and2 = and i64 %sub1, %4
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i64, ptr %y.addr, align 8
  %sub3 = sub i64 %5, %6
  %7 = load i64, ptr %m, align 8
  %not = xor i64 %7, -1
  %and4 = and i64 %sub3, %not
  %or = or i64 %and2, %and4
  store i64 %or, ptr %d, align 8
  %8 = load i64, ptr %x.addr, align 8
  %9 = load i64, ptr %y.addr, align 8
  %not5 = xor i64 %9, -1
  %and6 = and i64 %8, %not5
  %10 = load i64, ptr %x.addr, align 8
  %11 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %10, %11
  %not7 = xor i64 %xor, -1
  %12 = load i64, ptr %d, align 8
  %and8 = and i64 %not7, %12
  %or9 = or i64 %and6, %and8
  %shr10 = lshr i64 %or9, 63
  %conv = trunc i64 %shr10 to i32
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
