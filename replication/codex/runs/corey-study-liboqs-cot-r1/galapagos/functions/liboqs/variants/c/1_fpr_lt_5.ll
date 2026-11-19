; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r1/functions/liboqs/variants/c/1_fpr_lt_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r1/functions/liboqs/variants/c/1_fpr_lt_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %xh = alloca i32, align 4
  %yh = alloca i32, align 4
  %xl = alloca i32, align 4
  %yl = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %1 = load i64, ptr %x.addr, align 8
  %shr1 = lshr i64 %1, 32
  %conv2 = trunc i64 %shr1 to i32
  store i32 %conv2, ptr %xh, align 4
  %2 = load i64, ptr %y.addr, align 8
  %shr3 = lshr i64 %2, 32
  %conv4 = trunc i64 %shr3 to i32
  store i32 %conv4, ptr %yh, align 4
  %3 = load i64, ptr %x.addr, align 8
  %conv5 = trunc i64 %3 to i32
  store i32 %conv5, ptr %xl, align 4
  %4 = load i64, ptr %y.addr, align 8
  %conv6 = trunc i64 %4 to i32
  store i32 %conv6, ptr %yl, align 4
  %5 = load i32, ptr %sx, align 4
  %6 = load i64, ptr %y.addr, align 8
  %shr7 = lshr i64 %6, 63
  %conv8 = trunc i64 %shr7 to i32
  %cmp = icmp ne i32 %5, %conv8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, ptr %sx, align 4
  store i32 %7, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %8 = load i32, ptr %xh, align 4
  %9 = load i32, ptr %yh, align 4
  %cmp10 = icmp ne i32 %8, %9
  br i1 %cmp10, label %if.then12, label %if.end17

if.then12:                                        ; preds = %if.end
  %10 = load i32, ptr %sx, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then12
  %11 = load i32, ptr %xh, align 4
  %12 = load i32, ptr %yh, align 4
  %cmp13 = icmp ugt i32 %11, %12
  %conv14 = zext i1 %cmp13 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then12
  %13 = load i32, ptr %xh, align 4
  %14 = load i32, ptr %yh, align 4
  %cmp15 = icmp ult i32 %13, %14
  %conv16 = zext i1 %cmp15 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv14, %cond.true ], [ %conv16, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end
  %15 = load i32, ptr %sx, align 4
  %tobool18 = icmp ne i32 %15, 0
  br i1 %tobool18, label %cond.true19, label %cond.false22

cond.true19:                                      ; preds = %if.end17
  %16 = load i32, ptr %xl, align 4
  %17 = load i32, ptr %yl, align 4
  %cmp20 = icmp ugt i32 %16, %17
  %conv21 = zext i1 %cmp20 to i32
  br label %cond.end25

cond.false22:                                     ; preds = %if.end17
  %18 = load i32, ptr %xl, align 4
  %19 = load i32, ptr %yl, align 4
  %cmp23 = icmp ult i32 %18, %19
  %conv24 = zext i1 %cmp23 to i32
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false22, %cond.true19
  %cond26 = phi i32 [ %conv21, %cond.true19 ], [ %conv24, %cond.false22 ]
  store i32 %cond26, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end25, %cond.end, %if.then
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
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
