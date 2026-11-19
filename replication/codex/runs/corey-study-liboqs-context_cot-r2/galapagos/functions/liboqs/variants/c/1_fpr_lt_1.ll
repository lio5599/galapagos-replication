; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_1.c"
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
  br i1 %tobool, label %cond.true, label %cond.false6

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %sy, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %cond.true4, label %cond.false

cond.true4:                                       ; preds = %cond.true
  %4 = load i64, ptr %x.addr, align 8
  %5 = load i64, ptr %y.addr, align 8
  %cmp = icmp ugt i64 %4, %5
  %conv5 = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true4
  %cond = phi i32 [ %conv5, %cond.true4 ], [ 1, %cond.false ]
  br label %cond.end14

cond.false6:                                      ; preds = %entry
  %6 = load i32, ptr %sy, align 4
  %tobool7 = icmp ne i32 %6, 0
  br i1 %tobool7, label %cond.true8, label %cond.false9

cond.true8:                                       ; preds = %cond.false6
  br label %cond.end12

cond.false9:                                      ; preds = %cond.false6
  %7 = load i64, ptr %x.addr, align 8
  %8 = load i64, ptr %y.addr, align 8
  %cmp10 = icmp ult i64 %7, %8
  %conv11 = zext i1 %cmp10 to i32
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false9, %cond.true8
  %cond13 = phi i32 [ 0, %cond.true8 ], [ %conv11, %cond.false9 ]
  br label %cond.end14

cond.end14:                                       ; preds = %cond.end12, %cond.end
  %cond15 = phi i32 [ %cond, %cond.end ], [ %cond13, %cond.end12 ]
  ret i32 %cond15
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
