; ModuleID = '/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %s = alloca i64, align 8
  %d = alloca i64, align 8
  %lt = alloca i64, align 8
  %gt = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  store i64 %shr, ptr %s, align 8
  %1 = load i64, ptr %x.addr, align 8
  %2 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %1, %2
  %shr1 = lshr i64 %xor, 63
  store i64 %shr1, ptr %d, align 8
  %3 = load i64, ptr %x.addr, align 8
  %4 = load i64, ptr %y.addr, align 8
  %cmp = icmp ult i64 %3, %4
  %conv = zext i1 %cmp to i32
  %conv2 = sext i32 %conv to i64
  store i64 %conv2, ptr %lt, align 8
  %5 = load i64, ptr %y.addr, align 8
  %6 = load i64, ptr %x.addr, align 8
  %cmp3 = icmp ult i64 %5, %6
  %conv4 = zext i1 %cmp3 to i32
  %conv5 = sext i32 %conv4 to i64
  store i64 %conv5, ptr %gt, align 8
  %7 = load i64, ptr %d, align 8
  %8 = load i64, ptr %s, align 8
  %and = and i64 %7, %8
  %9 = load i64, ptr %d, align 8
  %xor6 = xor i64 %9, 1
  %10 = load i64, ptr %s, align 8
  %11 = load i64, ptr %gt, align 8
  %and7 = and i64 %10, %11
  %12 = load i64, ptr %s, align 8
  %xor8 = xor i64 %12, 1
  %13 = load i64, ptr %lt, align 8
  %and9 = and i64 %xor8, %13
  %or = or i64 %and7, %and9
  %and10 = and i64 %xor6, %or
  %or11 = or i64 %and, %and10
  %conv12 = trunc i64 %or11 to i32
  ret i32 %conv12
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
