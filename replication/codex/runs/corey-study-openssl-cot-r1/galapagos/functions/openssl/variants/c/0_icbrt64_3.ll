; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r1/functions/openssl/variants/c/0_icbrt64_3.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r1/functions/openssl/variants/c/0_icbrt64_3.c"
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
  %cube = alloca i64, align 8
  %bit = alloca i64, align 8
  %candidate = alloca i64, align 8
  %delta = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 0, ptr %cube, align 8
  store i64 2097152, ptr %bit, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %bit, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %r, align 8
  %2 = load i64, ptr %bit, align 8
  %add = add i64 %1, %2
  store i64 %add, ptr %candidate, align 8
  %3 = load i64, ptr %candidate, align 8
  %cmp1 = icmp ule i64 %3, 2642245
  br i1 %cmp1, label %if.then, label %if.end14

if.then:                                          ; preds = %for.body
  %4 = load i64, ptr %r, align 8
  %mul = mul i64 3, %4
  %5 = load i64, ptr %r, align 8
  %mul2 = mul i64 %mul, %5
  %6 = load i64, ptr %bit, align 8
  %mul3 = mul i64 %mul2, %6
  %7 = load i64, ptr %r, align 8
  %mul4 = mul i64 3, %7
  %8 = load i64, ptr %bit, align 8
  %mul5 = mul i64 %mul4, %8
  %9 = load i64, ptr %bit, align 8
  %mul6 = mul i64 %mul5, %9
  %add7 = add i64 %mul3, %mul6
  %10 = load i64, ptr %bit, align 8
  %11 = load i64, ptr %bit, align 8
  %mul8 = mul i64 %10, %11
  %12 = load i64, ptr %bit, align 8
  %mul9 = mul i64 %mul8, %12
  %add10 = add i64 %add7, %mul9
  store i64 %add10, ptr %delta, align 8
  %13 = load i64, ptr %delta, align 8
  %14 = load i64, ptr %x.addr, align 8
  %15 = load i64, ptr %cube, align 8
  %sub = sub i64 %14, %15
  %cmp11 = icmp ule i64 %13, %sub
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.then
  %16 = load i64, ptr %candidate, align 8
  store i64 %16, ptr %r, align 8
  %17 = load i64, ptr %delta, align 8
  %18 = load i64, ptr %cube, align 8
  %add13 = add i64 %18, %17
  store i64 %add13, ptr %cube, align 8
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.then
  br label %if.end14

if.end14:                                         ; preds = %if.end, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %19 = load i64, ptr %bit, align 8
  %shr = lshr i64 %19, 1
  store i64 %shr, ptr %bit, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %20 = load i64, ptr %r, align 8
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
