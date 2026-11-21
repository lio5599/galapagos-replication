; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r1/functions/openssl/variants/c/0_icbrt64_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r1/functions/openssl/variants/c/0_icbrt64_9.c"
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
  %x.addr = alloca i64, align 8
  %lo = alloca i64, align 8
  %hi = alloca i64, align 8
  %width = alloca i64, align 8
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %lo, align 8
  store i64 2642246, ptr %hi, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %entry
  %0 = load i64, ptr %hi, align 8
  %1 = load i64, ptr %lo, align 8
  %sub = sub i64 %0, %1
  %cmp = icmp ugt i64 %sub, 1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i64, ptr %hi, align 8
  %3 = load i64, ptr %lo, align 8
  %sub1 = sub i64 %2, %3
  store i64 %sub1, ptr %width, align 8
  %4 = load i64, ptr %lo, align 8
  %5 = load i64, ptr %width, align 8
  %div = udiv i64 %5, 3
  %add = add i64 %4, %div
  store i64 %add, ptr %a, align 8
  %6 = load i64, ptr %lo, align 8
  %7 = load i64, ptr %width, align 8
  %mul = mul i64 2, %7
  %div2 = udiv i64 %mul, 3
  %add3 = add i64 %6, %div2
  store i64 %add3, ptr %b, align 8
  %8 = load i64, ptr %b, align 8
  %9 = load i64, ptr %b, align 8
  %mul4 = mul i64 %8, %9
  %10 = load i64, ptr %b, align 8
  %mul5 = mul i64 %mul4, %10
  %11 = load i64, ptr %x.addr, align 8
  %cmp6 = icmp ule i64 %mul5, %11
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %12 = load i64, ptr %b, align 8
  store i64 %12, ptr %lo, align 8
  br label %if.end12

if.else:                                          ; preds = %while.body
  %13 = load i64, ptr %a, align 8
  %14 = load i64, ptr %a, align 8
  %mul7 = mul i64 %13, %14
  %15 = load i64, ptr %a, align 8
  %mul8 = mul i64 %mul7, %15
  %16 = load i64, ptr %x.addr, align 8
  %cmp9 = icmp ule i64 %mul8, %16
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else
  %17 = load i64, ptr %a, align 8
  store i64 %17, ptr %lo, align 8
  %18 = load i64, ptr %b, align 8
  store i64 %18, ptr %hi, align 8
  br label %if.end

if.else11:                                        ; preds = %if.else
  %19 = load i64, ptr %a, align 8
  store i64 %19, ptr %hi, align 8
  br label %if.end

if.end:                                           ; preds = %if.else11, %if.then10
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %20 = load i64, ptr %lo, align 8
  %shl = shl i64 %20, 12
  ret i64 %shl
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
