; ModuleID = '/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %d0 = alloca i64, align 8
  %d1 = alloca i64, align 8
  %lt0 = alloca i64, align 8
  %lt1 = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %y.addr, align 8
  %sub = sub i64 %0, %1
  store i64 %sub, ptr %d0, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %x.addr, align 8
  %sub1 = sub i64 %2, %3
  store i64 %sub1, ptr %d1, align 8
  %4 = load i64, ptr %d0, align 8
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %5, %6
  %7 = load i64, ptr %x.addr, align 8
  %8 = load i64, ptr %d0, align 8
  %xor2 = xor i64 %7, %8
  %and = and i64 %xor, %xor2
  %xor3 = xor i64 %4, %and
  %shr = lshr i64 %xor3, 63
  store i64 %shr, ptr %lt0, align 8
  %9 = load i64, ptr %d1, align 8
  %10 = load i64, ptr %x.addr, align 8
  %11 = load i64, ptr %y.addr, align 8
  %xor4 = xor i64 %10, %11
  %12 = load i64, ptr %y.addr, align 8
  %13 = load i64, ptr %d1, align 8
  %xor5 = xor i64 %12, %13
  %and6 = and i64 %xor4, %xor5
  %xor7 = xor i64 %9, %and6
  %shr8 = lshr i64 %xor7, 63
  store i64 %shr8, ptr %lt1, align 8
  %14 = load i64, ptr %x.addr, align 8
  %15 = load i64, ptr %y.addr, align 8
  %and9 = and i64 %14, %15
  %shr10 = lshr i64 %and9, 63
  %cmp = icmp ne i64 %shr10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %16 = load i64, ptr %lt1, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %17 = load i64, ptr %lt0, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %16, %cond.true ], [ %17, %cond.false ]
  %conv = trunc i64 %cond to i32
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
