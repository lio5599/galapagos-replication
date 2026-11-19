; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i64, ptr %in.addr, align 8
  %and = and i64 %1, 255
  %cmp1 = icmp eq i64 %and, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %r, align 4
  %add = add nsw i32 %2, 8
  store i32 %add, ptr %r, align 4
  %3 = load i64, ptr %in.addr, align 8
  %shr = lshr i64 %3, 8
  store i64 %shr, ptr %in.addr, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %4 = load i64, ptr %in.addr, align 8
  %and2 = and i64 %4, 15
  %cmp3 = icmp eq i64 %and2, 0
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %while.end
  %5 = load i32, ptr %r, align 4
  %add5 = add nsw i32 %5, 4
  store i32 %add5, ptr %r, align 4
  %6 = load i64, ptr %in.addr, align 8
  %shr6 = lshr i64 %6, 4
  store i64 %shr6, ptr %in.addr, align 8
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %while.end
  %7 = load i64, ptr %in.addr, align 8
  %and8 = and i64 %7, 3
  %cmp9 = icmp eq i64 %and8, 0
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end7
  %8 = load i32, ptr %r, align 4
  %add11 = add nsw i32 %8, 2
  store i32 %add11, ptr %r, align 4
  %9 = load i64, ptr %in.addr, align 8
  %shr12 = lshr i64 %9, 2
  store i64 %shr12, ptr %in.addr, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end7
  %10 = load i32, ptr %r, align 4
  %11 = load i64, ptr %in.addr, align 8
  %and14 = and i64 %11, 1
  %cmp15 = icmp eq i64 %and14, 0
  %conv = zext i1 %cmp15 to i32
  %add16 = add nsw i32 %10, %conv
  store i32 %add16, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
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
