; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %sy = alloca i32, align 4
  %ax = alloca i64, align 8
  %ay = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %1 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %1, 63
  %conv2 = trunc i64 %shr1 to i32
  store i32 %conv2, ptr %sy, align 4
  %2 = load i64, ptr %x.addr, align 8
  %and = and i64 %2, 9223372036854775807
  store i64 %and, ptr %ax, align 8
  %3 = load i64, ptr %y.addr, align 8
  %and3 = and i64 %3, 9223372036854775807
  store i64 %and3, ptr %ay, align 8
  %4 = load i32, ptr %sx, align 4
  %5 = load i32, ptr %sy, align 4
  %cmp = icmp ugt i32 %4, %5
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %6 = load i32, ptr %sx, align 4
  %7 = load i32, ptr %sy, align 4
  %cmp5 = icmp eq i32 %6, %7
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %8 = load i32, ptr %sx, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.rhs
  %9 = load i64, ptr %ax, align 8
  %10 = load i64, ptr %ay, align 8
  %cmp7 = icmp ugt i64 %9, %10
  %conv8 = zext i1 %cmp7 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.rhs
  %11 = load i64, ptr %ax, align 8
  %12 = load i64, ptr %ay, align 8
  %cmp9 = icmp ult i64 %11, %12
  %conv10 = zext i1 %cmp9 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %conv10, %cond.false ]
  %tobool11 = icmp ne i32 %cond, 0
  br label %land.end

land.end:                                         ; preds = %cond.end, %lor.rhs
  %13 = phi i1 [ false, %lor.rhs ], [ %tobool11, %cond.end ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %14 = phi i1 [ true, %entry ], [ %13, %land.end ]
  %lor.ext = zext i1 %14 to i32
  ret i32 %lor.ext
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
