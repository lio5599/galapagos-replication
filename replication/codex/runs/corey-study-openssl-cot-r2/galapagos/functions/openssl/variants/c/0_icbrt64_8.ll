; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r2/functions/openssl/variants/c/0_icbrt64_8.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r2/functions/openssl/variants/c/0_icbrt64_8.c"
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
  %lo = alloca i64, align 8
  %hi = alloca i64, align 8
  %m = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %lo, align 8
  store i64 1, ptr %hi, align 8
  %0 = load i64, ptr %x.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i64, ptr %hi, align 8
  %2 = load i64, ptr %x.addr, align 8
  %3 = load i64, ptr %hi, align 8
  %div = udiv i64 %2, %3
  %4 = load i64, ptr %hi, align 8
  %div1 = udiv i64 %div, %4
  %cmp2 = icmp ule i64 %1, %div1
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i64, ptr %hi, align 8
  store i64 %5, ptr %lo, align 8
  %6 = load i64, ptr %hi, align 8
  %shl = shl i64 %6, 1
  store i64 %shl, ptr %hi, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  br label %while.cond3

while.cond3:                                      ; preds = %if.end12, %while.end
  %7 = load i64, ptr %hi, align 8
  %8 = load i64, ptr %lo, align 8
  %sub = sub i64 %7, %8
  %cmp4 = icmp ugt i64 %sub, 1
  br i1 %cmp4, label %while.body5, label %while.end13

while.body5:                                      ; preds = %while.cond3
  %9 = load i64, ptr %lo, align 8
  %10 = load i64, ptr %hi, align 8
  %11 = load i64, ptr %lo, align 8
  %sub6 = sub i64 %10, %11
  %div7 = udiv i64 %sub6, 2
  %add = add i64 %9, %div7
  store i64 %add, ptr %m, align 8
  %12 = load i64, ptr %m, align 8
  %13 = load i64, ptr %x.addr, align 8
  %14 = load i64, ptr %m, align 8
  %div8 = udiv i64 %13, %14
  %15 = load i64, ptr %m, align 8
  %div9 = udiv i64 %div8, %15
  %cmp10 = icmp ule i64 %12, %div9
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %while.body5
  %16 = load i64, ptr %m, align 8
  store i64 %16, ptr %lo, align 8
  br label %if.end12

if.else:                                          ; preds = %while.body5
  %17 = load i64, ptr %m, align 8
  store i64 %17, ptr %hi, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then11
  br label %while.cond3, !llvm.loop !8

while.end13:                                      ; preds = %while.cond3
  %18 = load i64, ptr %lo, align 8
  %shl14 = shl i64 %18, 12
  store i64 %shl14, ptr %retval, align 8
  br label %return

return:                                           ; preds = %while.end13, %if.then
  %19 = load i64, ptr %retval, align 8
  ret i64 %19
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
!8 = distinct !{!8, !7}
