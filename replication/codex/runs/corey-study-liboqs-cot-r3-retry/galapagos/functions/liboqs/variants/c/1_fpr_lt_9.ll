; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r3-retry/functions/liboqs/variants/c/1_fpr_lt_9.c"
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
  %bit = alloca i64, align 8
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
  %3 = load i32, ptr %sy, align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %sx, align 4
  store i32 %4, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i64 4611686018427387904, ptr %bit, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, ptr %bit, align 8
  %cmp4 = icmp ne i64 %5, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %6, %7
  %8 = load i64, ptr %bit, align 8
  %and = and i64 %xor, %8
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then6, label %if.end11

if.then6:                                         ; preds = %for.body
  %9 = load i64, ptr %x.addr, align 8
  %10 = load i64, ptr %bit, align 8
  %and7 = and i64 %9, %10
  %cmp8 = icmp eq i64 %and7, 0
  %conv9 = zext i1 %cmp8 to i32
  %11 = load i32, ptr %sx, align 4
  %xor10 = xor i32 %conv9, %11
  store i32 %xor10, ptr %retval, align 4
  br label %return

if.end11:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %12 = load i64, ptr %bit, align 8
  %shr12 = lshr i64 %12, 1
  store i64 %shr12, ptr %bit, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
