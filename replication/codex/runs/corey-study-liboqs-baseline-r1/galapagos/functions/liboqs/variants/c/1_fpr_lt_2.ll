; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %sy = alloca i32, align 4
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
  %2 = load i32, ptr %sx, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, ptr %sy, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %lor.lhs.false, label %lor.end

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %4 = load i32, ptr %sx, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %lor.rhs, label %land.lhs.true5

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %5 = load i32, ptr %sy, align 4
  %tobool6 = icmp ne i32 %5, 0
  br i1 %tobool6, label %lor.rhs, label %land.lhs.true7

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %y.addr, align 8
  %cmp = icmp ult i64 %6, %7
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true7, %land.lhs.true5, %lor.lhs.false
  %8 = load i32, ptr %sx, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %land.lhs.true10, label %land.end

land.lhs.true10:                                  ; preds = %lor.rhs
  %9 = load i32, ptr %sy, align 4
  %tobool11 = icmp ne i32 %9, 0
  br i1 %tobool11, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true10
  %10 = load i64, ptr %x.addr, align 8
  %11 = load i64, ptr %y.addr, align 8
  %cmp12 = icmp ugt i64 %10, %11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true10, %lor.rhs
  %12 = phi i1 [ false, %land.lhs.true10 ], [ false, %lor.rhs ], [ %cmp12, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true7, %land.lhs.true
  %13 = phi i1 [ true, %land.lhs.true7 ], [ true, %land.lhs.true ], [ %12, %land.end ]
  %lor.ext = zext i1 %13 to i32
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
