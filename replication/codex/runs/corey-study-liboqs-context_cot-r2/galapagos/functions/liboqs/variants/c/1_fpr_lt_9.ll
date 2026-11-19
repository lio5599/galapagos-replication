; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r2/functions/liboqs/variants/c/1_fpr_lt_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i64, align 8
  %sy = alloca i64, align 8
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 63
  store i64 %shr, ptr %sx, align 8
  %1 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %1, 63
  store i64 %shr1, ptr %sy, align 8
  %2 = load i64, ptr %sx, align 8
  %3 = load i64, ptr %sy, align 8
  %cmp = icmp ne i64 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64, ptr %sx, align 8
  %conv = trunc i64 %4 to i32
  store i32 %conv, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i64, ptr %sx, align 8
  %tobool = icmp ne i64 %5, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %6 = load i64, ptr %y.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %7 = load i64, ptr %x.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %6, %cond.true ], [ %7, %cond.false ]
  store i64 %cond, ptr %a, align 8
  %8 = load i64, ptr %sx, align 8
  %tobool2 = icmp ne i64 %8, 0
  br i1 %tobool2, label %cond.true3, label %cond.false4

cond.true3:                                       ; preds = %cond.end
  %9 = load i64, ptr %x.addr, align 8
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  %10 = load i64, ptr %y.addr, align 8
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true3
  %cond6 = phi i64 [ %9, %cond.true3 ], [ %10, %cond.false4 ]
  store i64 %cond6, ptr %b, align 8
  %11 = load i64, ptr %a, align 8
  %12 = load i64, ptr %b, align 8
  %cmp7 = icmp ult i64 %11, %12
  %conv8 = zext i1 %cmp7 to i32
  store i32 %conv8, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end5, %if.then
  %13 = load i32, ptr %retval, align 4
  ret i32 %13
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
