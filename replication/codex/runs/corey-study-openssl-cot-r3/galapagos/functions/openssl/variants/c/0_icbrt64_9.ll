; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r3/functions/openssl/variants/c/0_icbrt64_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r3/functions/openssl/variants/c/0_icbrt64_9.c"
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
  %r = alloca i64, align 8
  %bit = alloca i64, align 8
  %mask = alloca i64, align 8
  %candidate = alloca i64, align 8
  %square = alloca i64, align 8
  %low = alloca i64, align 8
  %high = alloca i64, align 8
  %cube = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 4294967295, ptr %mask, align 8
  store i64 2097152, ptr %bit, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %bit, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %r, align 8
  %2 = load i64, ptr %bit, align 8
  %or = or i64 %1, %2
  store i64 %or, ptr %candidate, align 8
  %3 = load i64, ptr %candidate, align 8
  %4 = load i64, ptr %candidate, align 8
  %mul = mul i64 %3, %4
  store i64 %mul, ptr %square, align 8
  %5 = load i64, ptr %square, align 8
  %and = and i64 %5, 4294967295
  %6 = load i64, ptr %candidate, align 8
  %mul1 = mul i64 %and, %6
  store i64 %mul1, ptr %low, align 8
  %7 = load i64, ptr %square, align 8
  %shr = lshr i64 %7, 32
  %8 = load i64, ptr %candidate, align 8
  %mul2 = mul i64 %shr, %8
  %9 = load i64, ptr %low, align 8
  %shr3 = lshr i64 %9, 32
  %add = add i64 %mul2, %shr3
  store i64 %add, ptr %high, align 8
  %10 = load i64, ptr %high, align 8
  %cmp4 = icmp ule i64 %10, 4294967295
  br i1 %cmp4, label %if.then, label %if.end9

if.then:                                          ; preds = %for.body
  %11 = load i64, ptr %high, align 8
  %shl = shl i64 %11, 32
  %12 = load i64, ptr %low, align 8
  %and5 = and i64 %12, 4294967295
  %or6 = or i64 %shl, %and5
  store i64 %or6, ptr %cube, align 8
  %13 = load i64, ptr %cube, align 8
  %14 = load i64, ptr %x.addr, align 8
  %cmp7 = icmp ule i64 %13, %14
  br i1 %cmp7, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.then
  %15 = load i64, ptr %candidate, align 8
  store i64 %15, ptr %r, align 8
  br label %if.end

if.end:                                           ; preds = %if.then8, %if.then
  br label %if.end9

if.end9:                                          ; preds = %if.end, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %16 = load i64, ptr %bit, align 8
  %shr10 = lshr i64 %16, 1
  store i64 %shr10, ptr %bit, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %17 = load i64, ptr %r, align 8
  %shl11 = shl i64 %17, 12
  ret i64 %shl11
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
