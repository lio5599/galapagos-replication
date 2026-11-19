; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r2/functions/liboqs/variants/c/1_fpr_lt_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r2/functions/liboqs/variants/c/1_fpr_lt_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %difference = alloca i64, align 8
  %bit = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %0, %1
  store i64 %xor, ptr %difference, align 8
  store i64 -9223372036854775808, ptr %bit, align 8
  %2 = load i64, ptr %difference, align 8
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i64, ptr %difference, align 8
  %4 = load i64, ptr %bit, align 8
  %and = and i64 %3, %4
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %5 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %5, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end2
  %6 = load i64, ptr %bit, align 8
  %shr3 = lshr i64 %6, 1
  store i64 %shr3, ptr %bit, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %7 = load i64, ptr %difference, align 8
  %8 = load i64, ptr %bit, align 8
  %and4 = and i64 %7, %8
  %tobool5 = icmp ne i64 %and4, 0
  %lnot = xor i1 %tobool5, true
  br i1 %lnot, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  %9 = load i64, ptr %x.addr, align 8
  %shr6 = lshr i64 %9, 63
  %tobool7 = icmp ne i64 %shr6, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %10 = load i64, ptr %x.addr, align 8
  %11 = load i64, ptr %bit, align 8
  %and8 = and i64 %10, %11
  %cmp9 = icmp ne i64 %and8, 0
  %conv10 = zext i1 %cmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %do.end
  %12 = load i64, ptr %y.addr, align 8
  %13 = load i64, ptr %bit, align 8
  %and11 = and i64 %12, %13
  %cmp12 = icmp ne i64 %and11, 0
  %conv13 = zext i1 %cmp12 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %conv13, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then1, %if.then
  %14 = load i32, ptr %retval, align 4
  ret i32 %14
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
