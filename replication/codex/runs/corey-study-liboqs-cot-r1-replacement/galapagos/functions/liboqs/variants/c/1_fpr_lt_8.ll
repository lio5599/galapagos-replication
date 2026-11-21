; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_8.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %d = alloca i64, align 8
  %bit = alloca i64, align 8
  %sx = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %0, %1
  store i64 %xor, ptr %d, align 8
  %2 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %2, 63
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %sx, align 4
  %3 = load i64, ptr %d, align 8
  %shr1 = lshr i64 %3, 63
  %cmp = icmp ne i64 %shr1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %sx, align 4
  store i32 %4, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i64, ptr %d, align 8
  %cmp3 = icmp eq i64 %5, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 0, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %6 = load i64, ptr %d, align 8
  %shr7 = lshr i64 %6, 1
  %7 = load i64, ptr %d, align 8
  %or = or i64 %7, %shr7
  store i64 %or, ptr %d, align 8
  %8 = load i64, ptr %d, align 8
  %shr8 = lshr i64 %8, 2
  %9 = load i64, ptr %d, align 8
  %or9 = or i64 %9, %shr8
  store i64 %or9, ptr %d, align 8
  %10 = load i64, ptr %d, align 8
  %shr10 = lshr i64 %10, 4
  %11 = load i64, ptr %d, align 8
  %or11 = or i64 %11, %shr10
  store i64 %or11, ptr %d, align 8
  %12 = load i64, ptr %d, align 8
  %shr12 = lshr i64 %12, 8
  %13 = load i64, ptr %d, align 8
  %or13 = or i64 %13, %shr12
  store i64 %or13, ptr %d, align 8
  %14 = load i64, ptr %d, align 8
  %shr14 = lshr i64 %14, 16
  %15 = load i64, ptr %d, align 8
  %or15 = or i64 %15, %shr14
  store i64 %or15, ptr %d, align 8
  %16 = load i64, ptr %d, align 8
  %shr16 = lshr i64 %16, 32
  %17 = load i64, ptr %d, align 8
  %or17 = or i64 %17, %shr16
  store i64 %or17, ptr %d, align 8
  %18 = load i64, ptr %d, align 8
  %19 = load i64, ptr %d, align 8
  %shr18 = lshr i64 %19, 1
  %xor19 = xor i64 %18, %shr18
  store i64 %xor19, ptr %bit, align 8
  %20 = load i64, ptr %x.addr, align 8
  %21 = load i64, ptr %bit, align 8
  %and = and i64 %20, %21
  %cmp20 = icmp eq i64 %and, 0
  %conv21 = zext i1 %cmp20 to i32
  %22 = load i32, ptr %sx, align 4
  %xor22 = xor i32 %conv21, %22
  store i32 %xor22, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %23 = load i32, ptr %retval, align 4
  ret i32 %23
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
