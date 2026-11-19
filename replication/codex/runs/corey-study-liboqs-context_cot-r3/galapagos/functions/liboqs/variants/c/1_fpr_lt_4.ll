; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r3/functions/liboqs/variants/c/1_fpr_lt_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r3/functions/liboqs/variants/c/1_fpr_lt_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %high = alloca i64, align 8
  %kx = alloca i64, align 8
  %ky = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 -9223372036854775808, ptr %high, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  %tobool = icmp ne i64 %shr, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, ptr %x.addr, align 8
  %not = xor i64 %1, -1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64, ptr %x.addr, align 8
  %3 = load i64, ptr %high, align 8
  %xor = xor i64 %2, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %not, %cond.true ], [ %xor, %cond.false ]
  store i64 %cond, ptr %kx, align 8
  %4 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %4, 63
  %tobool2 = icmp ne i64 %shr1, 0
  br i1 %tobool2, label %cond.true3, label %cond.false5

cond.true3:                                       ; preds = %cond.end
  %5 = load i64, ptr %y.addr, align 8
  %not4 = xor i64 %5, -1
  br label %cond.end7

cond.false5:                                      ; preds = %cond.end
  %6 = load i64, ptr %y.addr, align 8
  %7 = load i64, ptr %high, align 8
  %xor6 = xor i64 %6, %7
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false5, %cond.true3
  %cond8 = phi i64 [ %not4, %cond.true3 ], [ %xor6, %cond.false5 ]
  store i64 %cond8, ptr %ky, align 8
  %8 = load i64, ptr %kx, align 8
  %9 = load i64, ptr %ky, align 8
  %cmp = icmp ult i64 %8, %9
  %conv = zext i1 %cmp to i32
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
