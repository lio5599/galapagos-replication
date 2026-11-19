; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
  %sy = alloca i32, align 4
  %hx = alloca i64, align 8
  %hy = alloca i64, align 8
  %lx = alloca i64, align 8
  %ly = alloca i64, align 8
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
  %shr3 = lshr i64 %2, 32
  store i64 %shr3, ptr %hx, align 8
  %3 = load i64, ptr %y.addr, align 8
  %shr4 = lshr i64 %3, 32
  store i64 %shr4, ptr %hy, align 8
  %4 = load i64, ptr %x.addr, align 8
  %and = and i64 %4, 4294967295
  store i64 %and, ptr %lx, align 8
  %5 = load i64, ptr %y.addr, align 8
  %and5 = and i64 %5, 4294967295
  store i64 %and5, ptr %ly, align 8
  %6 = load i32, ptr %sx, align 4
  %7 = load i32, ptr %sy, align 4
  %cmp = icmp ne i32 %6, %7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load i32, ptr %sx, align 4
  store i32 %8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %9 = load i64, ptr %hx, align 8
  %10 = load i64, ptr %hy, align 8
  %cmp7 = icmp ne i64 %9, %10
  br i1 %cmp7, label %if.then9, label %if.end14

if.then9:                                         ; preds = %if.end
  %11 = load i32, ptr %sx, align 4
  %tobool = icmp ne i32 %11, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then9
  %12 = load i64, ptr %hx, align 8
  %13 = load i64, ptr %hy, align 8
  %cmp10 = icmp ugt i64 %12, %13
  %conv11 = zext i1 %cmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then9
  %14 = load i64, ptr %hx, align 8
  %15 = load i64, ptr %hy, align 8
  %cmp12 = icmp ult i64 %14, %15
  %conv13 = zext i1 %cmp12 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %conv13, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  %16 = load i32, ptr %sx, align 4
  %tobool15 = icmp ne i32 %16, 0
  br i1 %tobool15, label %cond.true16, label %cond.false19

cond.true16:                                      ; preds = %if.end14
  %17 = load i64, ptr %lx, align 8
  %18 = load i64, ptr %ly, align 8
  %cmp17 = icmp ugt i64 %17, %18
  %conv18 = zext i1 %cmp17 to i32
  br label %cond.end22

cond.false19:                                     ; preds = %if.end14
  %19 = load i64, ptr %lx, align 8
  %20 = load i64, ptr %ly, align 8
  %cmp20 = icmp ult i64 %19, %20
  %conv21 = zext i1 %cmp20 to i32
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false19, %cond.true16
  %cond23 = phi i32 [ %conv18, %cond.true16 ], [ %conv21, %cond.false19 ]
  store i32 %cond23, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end22, %cond.end, %if.then
  %21 = load i32, ptr %retval, align 4
  ret i32 %21
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
