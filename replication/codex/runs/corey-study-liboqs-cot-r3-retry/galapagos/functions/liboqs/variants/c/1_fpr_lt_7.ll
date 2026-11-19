; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_7.c"
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
  %3 = load i64, ptr %y.addr, align 8
  %cmp = icmp eq i64 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, ptr %sx, align 4
  %5 = load i32, ptr %sy, align 4
  %cmp4 = icmp ne i32 %4, %5
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %6 = load i32, ptr %sx, align 4
  store i32 %6, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %7 = load i64, ptr %x.addr, align 8
  %8 = load i64, ptr %y.addr, align 8
  %cmp8 = icmp ult i64 %7, %8
  %conv9 = zext i1 %cmp8 to i32
  %9 = load i32, ptr %sx, align 4
  %xor = xor i32 %conv9, %9
  store i32 %xor, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then6, %if.then
  %10 = load i32, ptr %retval, align 4
  ret i32 %10
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
