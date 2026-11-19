; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r1/functions/liboqs/variants/c/1_fpr_lt_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r1/functions/liboqs/variants/c/1_fpr_lt_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %shift = alloca i32, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %1 = load i32, ptr %sx, align 4
  %2 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %2, 63
  %conv2 = trunc i64 %shr1 to i32
  %cmp = icmp ne i32 %1, %conv2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %sx, align 4
  store i32 %3, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 56, ptr %shift, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, ptr %shift, align 4
  %cmp4 = icmp sge i32 %4, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i32, ptr %shift, align 4
  %sh_prom = zext i32 %6 to i64
  %shr6 = lshr i64 %5, %sh_prom
  %and = and i64 %shr6, 255
  %conv7 = trunc i64 %and to i32
  store i32 %conv7, ptr %bx, align 4
  %7 = load i64, ptr %y.addr, align 8
  %8 = load i32, ptr %shift, align 4
  %sh_prom8 = zext i32 %8 to i64
  %shr9 = lshr i64 %7, %sh_prom8
  %and10 = and i64 %shr9, 255
  %conv11 = trunc i64 %and10 to i32
  store i32 %conv11, ptr %by, align 4
  %9 = load i32, ptr %bx, align 4
  %10 = load i32, ptr %by, align 4
  %cmp12 = icmp ne i32 %9, %10
  br i1 %cmp12, label %if.then14, label %if.end19

if.then14:                                        ; preds = %for.body
  %11 = load i32, ptr %sx, align 4
  %tobool = icmp ne i32 %11, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then14
  %12 = load i32, ptr %bx, align 4
  %13 = load i32, ptr %by, align 4
  %cmp15 = icmp ugt i32 %12, %13
  %conv16 = zext i1 %cmp15 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then14
  %14 = load i32, ptr %bx, align 4
  %15 = load i32, ptr %by, align 4
  %cmp17 = icmp ult i32 %14, %15
  %conv18 = zext i1 %cmp17 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv16, %cond.true ], [ %conv18, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end19:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %16 = load i32, ptr %shift, align 4
  %sub = sub nsw i32 %16, 8
  store i32 %sub, ptr %shift, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %cond.end, %if.then
  %17 = load i32, ptr %retval, align 4
  ret i32 %17
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
