; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r1/functions/openssl/variants/c/0_icbrt64_5.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r1/functions/openssl/variants/c/0_icbrt64_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @icbrt64(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @icbrt64(i64 noundef %x) #0 {
entry:
  %retval = alloca i64, align 8
  %x.addr = alloca i64, align 8
  %t = alloca i64, align 8
  %r = alloca i64, align 8
  %bits = alloca i32, align 4
  %quotient = alloca i64, align 8
  %next = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  store i64 %0, ptr %t, align 8
  store i32 0, ptr %bits, align 4
  %1 = load i64, ptr %x.addr, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %2 = load i64, ptr %t, align 8
  %cmp1 = icmp ne i64 %2, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, ptr %bits, align 4
  %inc = add i32 %3, 1
  store i32 %inc, ptr %bits, align 4
  %4 = load i64, ptr %t, align 8
  %shr = lshr i64 %4, 1
  store i64 %shr, ptr %t, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %5 = load i32, ptr %bits, align 4
  %add = add i32 %5, 2
  %div = udiv i32 %add, 3
  %sh_prom = zext i32 %div to i64
  %shl = shl i64 1, %sh_prom
  store i64 %shl, ptr %r, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end9, %while.end
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %r, align 8
  %div2 = udiv i64 %6, %7
  %8 = load i64, ptr %r, align 8
  %div3 = udiv i64 %div2, %8
  store i64 %div3, ptr %quotient, align 8
  %9 = load i64, ptr %r, align 8
  %10 = load i64, ptr %r, align 8
  %add4 = add i64 %9, %10
  %11 = load i64, ptr %quotient, align 8
  %add5 = add i64 %add4, %11
  %div6 = udiv i64 %add5, 3
  store i64 %div6, ptr %next, align 8
  %12 = load i64, ptr %next, align 8
  %13 = load i64, ptr %r, align 8
  %cmp7 = icmp uge i64 %12, %13
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.cond
  br label %for.end

if.end9:                                          ; preds = %for.cond
  %14 = load i64, ptr %next, align 8
  store i64 %14, ptr %r, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then8
  %15 = load i64, ptr %r, align 8
  %shl10 = shl i64 %15, 12
  store i64 %shl10, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %16 = load i64, ptr %retval, align 8
  ret i64 %16
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
