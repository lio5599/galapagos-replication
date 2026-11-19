; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r1/functions/liboqs/variants/c/1_fpr_lt_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-context_cot-r1/functions/liboqs/variants/c/1_fpr_lt_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sx = alloca i32, align 4
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
  %1 = load i64, ptr %x.addr, align 8
  %shr1 = lshr i64 %1, 32
  store i64 %shr1, ptr %hx, align 8
  %2 = load i64, ptr %y.addr, align 8
  %shr2 = lshr i64 %2, 32
  store i64 %shr2, ptr %hy, align 8
  %3 = load i64, ptr %x.addr, align 8
  %and = and i64 %3, 4294967295
  store i64 %and, ptr %lx, align 8
  %4 = load i64, ptr %y.addr, align 8
  %and3 = and i64 %4, 4294967295
  store i64 %and3, ptr %ly, align 8
  %5 = load i64, ptr %x.addr, align 8
  %6 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %5, %6
  %shr4 = lshr i64 %xor, 63
  %tobool = icmp ne i64 %shr4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, ptr %sx, align 4
  store i32 %7, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %8 = load i64, ptr %hx, align 8
  %9 = load i64, ptr %hy, align 8
  %cmp = icmp ne i64 %8, %9
  br i1 %cmp, label %if.then6, label %if.end12

if.then6:                                         ; preds = %if.end
  %10 = load i32, ptr %sx, align 4
  %tobool7 = icmp ne i32 %10, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  %11 = load i64, ptr %hx, align 8
  %12 = load i64, ptr %hy, align 8
  %cmp8 = icmp ugt i64 %11, %12
  %conv9 = zext i1 %cmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  %13 = load i64, ptr %hx, align 8
  %14 = load i64, ptr %hy, align 8
  %cmp10 = icmp ult i64 %13, %14
  %conv11 = zext i1 %cmp10 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %conv11, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end
  %15 = load i32, ptr %sx, align 4
  %tobool13 = icmp ne i32 %15, 0
  br i1 %tobool13, label %cond.true14, label %cond.false17

cond.true14:                                      ; preds = %if.end12
  %16 = load i64, ptr %lx, align 8
  %17 = load i64, ptr %ly, align 8
  %cmp15 = icmp ugt i64 %16, %17
  %conv16 = zext i1 %cmp15 to i32
  br label %cond.end20

cond.false17:                                     ; preds = %if.end12
  %18 = load i64, ptr %lx, align 8
  %19 = load i64, ptr %ly, align 8
  %cmp18 = icmp ult i64 %18, %19
  %conv19 = zext i1 %cmp18 to i32
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false17, %cond.true14
  %cond21 = phi i32 [ %conv16, %cond.true14 ], [ %conv19, %cond.false17 ]
  store i32 %cond21, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end20, %cond.end, %if.then
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
