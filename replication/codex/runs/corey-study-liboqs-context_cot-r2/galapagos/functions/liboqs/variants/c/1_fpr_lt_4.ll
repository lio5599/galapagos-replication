; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i64, align 8
  %sy = alloca i64, align 8
  %negative_mask = alloca i64, align 8
  %different_mask = alloca i64, align 8
  %same_result = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  store i64 %shr, ptr %sx, align 8
  %1 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %1, 63
  store i64 %shr1, ptr %sy, align 8
  %2 = load i64, ptr %sx, align 8
  %sub = sub i64 0, %2
  store i64 %sub, ptr %negative_mask, align 8
  %3 = load i64, ptr %sx, align 8
  %4 = load i64, ptr %sy, align 8
  %xor = xor i64 %3, %4
  %sub2 = sub i64 0, %xor
  store i64 %sub2, ptr %different_mask, align 8
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i64, ptr %y.addr, align 8
  %cmp = icmp ult i64 %5, %6
  %conv = zext i1 %cmp to i32
  %conv3 = sext i32 %conv to i64
  %7 = load i64, ptr %negative_mask, align 8
  %not = xor i64 %7, -1
  %and = and i64 %conv3, %not
  %8 = load i64, ptr %x.addr, align 8
  %9 = load i64, ptr %y.addr, align 8
  %cmp4 = icmp ugt i64 %8, %9
  %conv5 = zext i1 %cmp4 to i32
  %conv6 = sext i32 %conv5 to i64
  %10 = load i64, ptr %negative_mask, align 8
  %and7 = and i64 %conv6, %10
  %or = or i64 %and, %and7
  store i64 %or, ptr %same_result, align 8
  %11 = load i64, ptr %same_result, align 8
  %12 = load i64, ptr %different_mask, align 8
  %not8 = xor i64 %12, -1
  %and9 = and i64 %11, %not8
  %13 = load i64, ptr %sx, align 8
  %14 = load i64, ptr %different_mask, align 8
  %and10 = and i64 %13, %14
  %or11 = or i64 %and9, %and10
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
